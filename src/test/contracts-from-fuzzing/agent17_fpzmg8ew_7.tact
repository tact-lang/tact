contract GetterCell {
    c: Cell;

    init() {
        // Using correct Tact built-in functions: beginCell(), storeInt(), and endCell()
        self.c = beginCell().storeInt(5, 32).endCell();
    }

    // Getter returning a Cell type
    get fun getCell(): Cell {
        return self.c;
    }

    receive() {}
}
