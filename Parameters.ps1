param(
    [Parameter(Mandatory)]
    $UserName, 
    [Parameter(HelpMessage = "The start date of this employee")]
    [DateTime]$StartDate,
    [Parameter(HelpMessage = "If this user is a new hire.")]
    [bool]$NewHire,
    [Parameter()]
    [SecureString]$Password
)

@{
    UserName = $UserName
    StartDate = $StartDate 
    NewHire = $NewHire
}