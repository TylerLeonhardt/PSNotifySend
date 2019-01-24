$ModuleManifestName = 'PSNotifySend.psd1'
$ModuleManifestPath = "$PSScriptRoot\..\src\$ModuleManifestName"
Import-Module $ModuleManifestPath -Force

Describe 'Module Manifest Tests' {
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path $ModuleManifestPath | Should -Not -BeNullOrEmpty
        $? | Should Be $true
    }
}

Describe "Notification WhatIf tests" {
    Context "Send-OSNotification" {
        It "Should fire a notification" {
            # Since it's non-trivial to detect the notification that gets fired on each platform,
            # we are testing using WhatIf and verifying the operation that would be performed.
            Start-Transcript tmp.log
            try {
                Send-PSNotification "Hello World" -WhatIf
            }
            finally {
                Stop-Transcript
            }

            $log = Get-Content tmp.log | Where-Object { $_ -match "What if: Performing the operation" }
            Remove-Item tmp.log

            $expected = 'What if: Performing the operation "Send-PSNotification" on target "notify-send --icon=powershell-logo PowerShell Notification Hello World".'
            $log -join [System.Environment]::NewLine | Should -Be $expected
        }
    }
}
