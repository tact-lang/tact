contract TestCellGetter {
    cellValue: Cell;

    init() {
        self.cellValue = beginCell().storeUint(999, 32).endCell();
    }

    receive() {}

    get fun getCell(): Cell {
        return self.cellValue;
    }
}
