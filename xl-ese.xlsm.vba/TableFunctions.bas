''' Table functions
Function TableIsEmpty(tableName As String) As Boolean
    TableIsEmpty = True
    If WorksheetFunction.CountA(Range(tableName)) Then TableIsEmpty = False
End Function

Function CellValue(tbl As ListObject, row As Range, columnName As String) As String
    CellValue = row.Cells(1, tbl.ListColumns(columnName).Index)
End Function

Function CellDateValue(tbl As ListObject, row As Range, columnName As String) As String
    CellDateValue = FormatDate(row.Cells(1, tbl.ListColumns(columnName).Index))
End Function

Function CellTimeValue(tbl As ListObject, row As Range, columnName As String) As String
    CellTimeValue = Format(row.Cells(1, tbl.ListColumns(columnName).Index), "hh:nn:ss")
End Function

Function FormatDate(d As Date) As String
    If d <> Empty Then
        FormatDate = Format(d, "yyyy-mm-dd")
    End If
End Function

Function Lookup(value As String, table As String, Optional col As Integer) As String
    If col = 0 Then col = 2

    Lookup = ""
    
    If Not value = Empty Then
        Dim tbl As Range
        Set tbl = Range(table)
        
        Dim result As Variant
        result = Application.VLookup(value, tbl, col, False)
                
        If IsError(result) Then
            Lookup = "[ERROR]"
            AlertError ("Invalid value entered for " & table & ": '" & value & "' does not exist.")
        Else
            Lookup = result
        End If
    End If
End Function