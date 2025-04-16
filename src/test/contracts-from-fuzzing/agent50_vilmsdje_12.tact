contract TestCell {
    // Test constant evaluation of the built-in cell function, which converts a base64 string into a Cell.
    // Using a known base64 string from the documentation: "te6cckEBAQEAAgAAAEysuc0=".
    // We then convert the cell to a Slice using asSlice() and dump its number of bits.
    const CEL: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

    receive() {
        dump(self.CEL.asSlice().bits());
    }
}
