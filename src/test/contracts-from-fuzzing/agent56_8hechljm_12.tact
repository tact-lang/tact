contract SliceTest {
    c: Cell;

    init() {
        self.c = beginCell().storeUint(123, 16).endCell();
    }

    receive() {}

    get fun getSlice(): Slice {
        return self.c.beginParse();
    }
}
