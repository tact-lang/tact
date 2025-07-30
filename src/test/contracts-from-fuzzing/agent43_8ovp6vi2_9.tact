contract ConstantCellTest() {
    // This constant is evaluated at compile-time using the built-in function cell, which parses a Base64 string into a Cell.
    // According to the documentation, the provided string should be a valid Base64 encoding of a Cell.
    const c: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

    // A function returning the cell c converted to its Slice's bit length.
    fun getCellBits(): Int {
        // Access the maximum bits stored in the cell via self.c.
        return self.c.asSlice().bits();
    }

    // Dummy receive to ensure the contract is fully compiled.
    receive() {}
}
