contract TestCell {
    // Using a compile-time function to obtain a Cell from its base64 representation
    const CELL: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

    // Getter function to expose the compile-time computed Cell constant
    get fun getCell(): Cell {
        return self.CELL;
    }

    // Dummy receiver
    receive() { return; }
}
