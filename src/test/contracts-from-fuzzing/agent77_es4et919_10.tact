contract SliceGetter {
    data: Cell;

    init() {
        self.data = beginCell().storeUint(222, 8).endCell();
    }

    receive() {}

    get fun getSlice(): Slice {
        return self.data.beginParse();
    }
}
