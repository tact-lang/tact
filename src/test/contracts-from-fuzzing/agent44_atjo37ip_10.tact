contract TestSlice {
    s: Slice;

    init() {
        let cell = beginCell().storeUint(100, 8).endCell();
        self.s = cell.beginParse();
    }

    receive() {}

    get fun getSlice(): Slice {
        return self.s;
    }
}
