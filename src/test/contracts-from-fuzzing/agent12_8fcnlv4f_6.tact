const testCell: Cell = cell("te6cckEBAQEAAgAAAEysuc0=");

contract TestCell() {
    get fun getCell(): Cell {
        return testCell;
    }
    
    // Dummy receiver
    receive() {}
}
