contract GetterSlice {
    c: Cell;

    init() {
        self.c = beginCell().storeUint(99, 8).endCell();
    }

    receive() {}

    // Getter that returns a Slice derived from the cell
    get fun get_slice(): Slice {
        return self.c.beginParse();
    }
}
