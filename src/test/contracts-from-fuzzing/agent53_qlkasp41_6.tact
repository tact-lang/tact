contract TestCell() {
    // Use compile-time function cell() to create a cell from Base64 string
    const TEST_CELL: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

    // To get the number of bits in the cell, convert it to a Slice and then use bits()
    get fun getCellBits() : Int {
         return self.TEST_CELL.asSlice().bits();
    }
}
