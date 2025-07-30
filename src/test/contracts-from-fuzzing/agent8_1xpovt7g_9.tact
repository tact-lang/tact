contract TestCellConstant() {
    // Test constant evaluation for the compile-time function cell
    // Using a sample base64 representation of a Cell
    const C: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

    receive() {
        // Convert the cell to a slice using asSlice() and check that it contains some bits
        require(self.C.asSlice().bits() > 0, "cell constant produced an empty slice");
        cashback(sender());
    }
}
