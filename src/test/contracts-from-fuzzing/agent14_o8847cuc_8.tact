contract TestCellEquality {
    // Using compile-time cell() to generate a cell, and emptyCell() to generate an empty cell
    const EMPTY_CELL: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

    receive() {
        // Check that the compile-time generated cell is equal to an empty cell
        require(self.EMPTY_CELL == emptyCell(), "Empty cell is not equal to emptyCell()");
    }
}
