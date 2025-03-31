contract Test6v2 {
    c: Cell;

    init() {
        self.c = beginCell().storeUint(42, 8).endCell();
    }

    receive() {}

    // Getter that returns the stored Cell
    get fun getCell(): Cell {
        return self.c;
    }
}
