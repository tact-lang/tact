contract TestCellConstant() {
    // This contract tests compile-time evaluation of the cell() function.
    // Expected: cell("te6cckEBAQEAAgAAAEysuc0=") produces a Cell value that is well-formed.
    const my_cell: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

    // A getter function returning the cell. Consumers can inspect the cell if needed.
    get fun value() : Cell {
        return self.my_cell;
    }
}
