contract TestCellConstant {
    // This contract defines a constant cell using a valid base64 string
    // and returns its bit count by converting it to a slice.
    // The provided base64 string is taken from the documentation.
    const someCell: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

    get fun getCellBitCount(): Int {
         // Convert the cell to a slice and then return the number of bits in that slice
         let sl: Slice = self.someCell.asSlice();
         return sl.bits();
    }
}
