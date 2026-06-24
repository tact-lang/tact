contract TestCellGetter {
    c: Cell;

    init() {
        self.c = beginCell().storeUint(42, 32).endCell();
    }

    receive() {}

    get fun getCell(): Cell {
        return self.c;
    }
}
