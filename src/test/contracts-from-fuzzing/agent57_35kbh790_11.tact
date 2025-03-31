contract TestGetterSlice {
    c: Cell;

    init() {
        self.c = beginCell().storeUint(456, 32).endCell();
    }

    receive() {}

    // Getter returns a slice derived from a cell
    get fun getSlice(): Slice {
        let s: Slice = self.c.beginParse();
        return s;
    }
}
