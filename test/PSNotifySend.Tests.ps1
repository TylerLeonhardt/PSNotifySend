$ModuleManifestName = 'PSNotifySend.psd1'
$ModuleManifestPath = "$PSScriptRoot\..\src\$ModuleManifestName"

Describe 'Module Manifest Tests' {
    BeforeAll {
        Import-Module $ModuleManifestPath -Force
    }
    It 'Passes Test-ModuleManifest' {
        Test-ModuleManifest -Path $ModuleManifestPath | Should Not BeNullOrEmpty
        $? | Should Be $true
    }
}
