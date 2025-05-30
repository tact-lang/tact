contract TestCell() {
    receive() {
        // Use the built-in compile-time function to decode a cell from a base64 string
        let c: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");
        dump(c);
    }
}
