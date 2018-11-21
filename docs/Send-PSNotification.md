---
external help file: PSNotifySend-help.xml
Module Name: PSNotifySend
online version:
schema: 2.0.0
---

# Send-PSNotification

## SYNOPSIS
Sends a notification on Linux.

## SYNTAX

```
Send-PSNotification [-Body] <Object> [-Summary <String>] [-Urgency <Object>] [-ExpireTime <Int32>]
 [-Icon <String[]>] [-Category <String[]>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Sends a notification on Linux.
Under the hood, this uses notify-send(1)

## EXAMPLES

### EXAMPLE 1
```
Send-PSNotification 'Hello World'
```

### EXAMPLE 2
```
Send-PSNotification 'Hello World' -Urgency critical
```

### EXAMPLE 3
```
Send-PSNotification 'Hello World' -Category email,email.arrived
```

### EXAMPLE 4
```
Send-PSNotification 'Hello World' -Icon my-icon
```

## PARAMETERS

### -Body
The body or main content of the notification.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Summary
The summary or title of the notification.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: PowerShell Notification
Accept pipeline input: False
Accept wildcard characters: False
```

### -Urgency
Specifies the urgency level (low, normal, critical).

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ExpireTime
Specifies the timeout in milliseconds at which to expire the notification.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -Icon
Specifies an icon filename or stock icon to display.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Powershell-logo
Accept pipeline input: False
Accept wildcard characters: False
```

### -Category
Specifies the notification category.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable.
For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Not all linux distros support ExpireTime.
They will fire the notification for a constant duration regardless of what is set.
Not all linux distros support passing a path in for Icon.
They will show nothing if not supported.
Best practice is to put the icon file in $HOME/.local/share/icons and then specify the name of the file: -Icon my-icon
Not all linux distros support Category.
They will show nothing if not supported.

## RELATED LINKS
