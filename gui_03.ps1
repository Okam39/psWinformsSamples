$form = New-Object System.Windows.Forms.Form
$form.Size = New-Object System.Drawing.Size(900,600)
$dataGridView = New-Object System.Windows.Forms.DataGridView
$dataGridView.Size=New-Object System.Drawing.Size(800,400)
$go = New-Object System.Windows.Forms.Button
$go.Location = New-Object System.Drawing.Size(300,450)
$go.Size = New-Object System.Drawing.Size(75,23)
$go.text = "Select"
$form.Controls.Add($go)
$form.Controls.Add($dataGridView)


$dataGridView.ColumnCount = 4
$dataGridView.ColumnHeadersVisible = $true
$dataGridView.Columns[0].Name = "Name"
$dataGridView.Columns[1].Name = "ID"
$dataGridView.Columns[2].Name = "Description"
$dataGridView.Columns[3].Name = "Memory"

$dataGridView.Columns[0].width = 240

get-process | foreach {
    $dataGridView.Rows.Add($_.Name,$_.ID,$_.Description,$_.WorkingSet) | out-null
}

$go.Add_Click({
    $selectedRow = $dataGridView.CurrentRow.Index
    # ou bien avec :
    #$dataGridView.CurrentCell.RowIndex
    #$dataGridView.SelectedRows[0].Index
write-host $selectedRow
})

[void]$form.ShowDialog() 