<#
.SYNOPSIS
Sends a notification on Linux.

.DESCRIPTION
Sends a notification on Linux. Under the hood, this uses notify-send(1)

.PARAMETER Body
The body or main content of the notification.

.PARAMETER Summary
The summary or title of the notification.

.PARAMETER Urgency
Specifies the urgency level (low, normal, critical).

.PARAMETER ExpireTime
Specifies the timeout in milliseconds at which to expire the notification.

.PARAMETER Icon
Specifies an icon filename or stock icon to display.

.PARAMETER Category
Specifies the notification category.

.EXAMPLE
Send-PSNotification 'Hello World'

.EXAMPLE
Send-PSNotification 'Hello World' -Urgency critical

.EXAMPLE
Send-PSNotification 'Hello World' -Category email,email.arrived

.EXAMPLE
Send-PSNotification 'Hello World' -Icon my-icon

.NOTES
Not all linux distros support ExpireTime. They will fire the notification for a constant duration regardless of what is set.
Not all linux distros support passing a path in for Icon. They will show nothing if not supported. Best practice is to put the icon file in $HOME/.local/share/icons and then specify the name of the file: -Icon my-icon
Not all linux distros support Category. They will show nothing if not supported.

#>
function Send-PSNotification {
    [cmdletbinding(SupportsShouldProcess=$true)]
    param(
        [Parameter(Mandatory,ValueFromPipeline,Position=0)]
        [object]
        $Body,

        [String]
        $Summary = 'PowerShell Notification',

        [ValidateSet('low', 'normal', 'critical')]
        $Urgency,

        [int]
        $ExpireTime,

        [string[]]
        $Icon = "powershell-logo",

        [ValidateSet("device","device.added","device.error","device.removed",
        "email","email.arrived","email.bounced",
        "im","im.error","im.received",
        "network","network.connected","network.disconnected","network.error",
        "presence","presence.offline","presence.online",
        "transfer","transfer.complete","transfer.error")]
        [string[]]
        $Category
    )
    begin {
        $notifySendArgs = @()

        if ($Urgency) {
            $notifySendArgs += "--urgency=$Urgency"
        }

        if ($ExpireTime) {
            $notifySendArgs += "--expire-time=$ExpireTime"
        }

        if ($Icon) {
            if ($Icon -eq "powershell-logo") {
                Add-DefaultPSIcon
            }
            $notifySendArgs += "--icon=$($Icon -join ',')"
        }

        if ($Catagory) {
            $notifySendArgs += "--category=$($Catagory -join ',')"
        }

        $notifySendArgs += $Summary
        $notifySendArgs += ""
    }

    process {
        $notifySendArgs[$notifySendArgs.Length - 1] = $Body
        If ($PSCmdlet.ShouldProcess("notify-send $($notifySendArgs -join ' ')")) {
            & "notify-send" $notifySendArgs
        }
    }

    end {}
}
