contract TestReturnSlice {
    data: Cell;

    init() {
        self.data = beginCell().storeUint(42, 7).endCell();
    }

    receive() {}

    get fun getSlice(): Slice {
        return self.data.asSlice();
    }
}
