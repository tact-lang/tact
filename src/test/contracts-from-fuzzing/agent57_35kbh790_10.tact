contract TestGetterCell {
    c: Cell;

    init() {
        self.c = beginCell().storeUint(123, 32).endCell();
    }

    receive() {}

    // Getter returns a cell
    get fun getCell(): Cell {
        return self.c;
    }
}
