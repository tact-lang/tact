contract TestCellGetter {
    cellVar: Cell;

    init() {
        self.cellVar = beginCell().storeUint(99, 8).endCell();
    }

    receive() {}

    // Getter returning a serialized Cell
    get fun getCell(): Cell {
        return self.cellVar;
    }
}
