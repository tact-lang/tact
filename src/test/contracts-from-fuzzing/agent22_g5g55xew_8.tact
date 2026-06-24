contract TestCell() {
    // Test compile-time evaluation of the cell() built-in function
    // The provided base64 string should represent a valid Cell
    const CEL: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

    receive() {
        dump(self.CEL);
    }
}
