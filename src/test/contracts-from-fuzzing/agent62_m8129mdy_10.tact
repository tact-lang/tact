contract GetterTestSlice {
    c: Cell;

    init() {
        self.c = beginCell().storeUint(123, 32).endCell();
    }

    receive() {}

    get fun getSlice(): Slice {
        return self.c.beginParse();
    }
}
