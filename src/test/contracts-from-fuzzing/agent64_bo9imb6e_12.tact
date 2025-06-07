contract TestSlice {
    c: Cell;

    init() {
        self.c = beginCell().storeUint(456, 32).endCell();
    }

    receive() {}

    get fun getSlice(): Slice {
        return self.c.beginParse();
    }
}
