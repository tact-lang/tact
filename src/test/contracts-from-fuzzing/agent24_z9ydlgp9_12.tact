contract TestSliceGetter {
    c: Cell;

    init() {
        self.c = beginCell().storeUint(456, 16).endCell();
    }

    receive() {}

    get fun getSlice(): Slice {
        return self.c.beginParse();
    }
}
