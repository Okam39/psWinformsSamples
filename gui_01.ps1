[reflection.assembly]::LoadWithPartialName( "System.Windows.Forms")

function do_exit
{
     $form.close()
}



$form= New-Object Windows.Forms.Form
$form.text = "PowerShell WinForms Example"

$button = New-Object Windows.Forms.Button
$button.text = "Click Here!"
$button.add_click({do_exit})

$form.controls.add($button)

$form.ShowDialog()
