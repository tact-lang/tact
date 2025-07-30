contract TestCellGetter {
    c: Cell;

    init() {
        self.c = beginCell().storeUint(255, 8).endCell();
    }

    receive() {}

    // Getter returning a Cell directly
    get fun getCell(): Cell {
        return self.c;
    }
}
