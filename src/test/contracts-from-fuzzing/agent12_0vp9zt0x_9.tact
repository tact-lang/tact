contract TestSliceGetter {
    c: Cell;

    init() {
        self.c = beginCell().storeInt(42, 8).endCell();
    }

    receive() {}

    get fun getSlice(): Slice {
        return self.c.asSlice();
    }
}
