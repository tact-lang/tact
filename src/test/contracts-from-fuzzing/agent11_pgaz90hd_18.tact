contract TestCell() {
    // Testing the cell built-in function with a base64-encoded BoC.
    // The given base64 string represents a valid Cell per documentation.
    const MY_CELL: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

    receive() {
        // Dumping the Cell will show its serialized representation.
        dump(self.MY_CELL);
    }
}
