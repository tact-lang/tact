contract TestCell {
    c: Cell;

    init() {
        self.c = beginCell().storeUint(999, 32).endCell();
    }

    receive() {}

    // Getter function that returns a Cell
    get fun getCell(): Cell {
        return self.c;
    }
}
