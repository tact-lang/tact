contract TestSliceGetterFixed2 {
    cellValue: Cell;

    init() {
        self.cellValue = beginCell().storeUint(123, 32).endCell();
    }

    receive() {}

    get fun getSlice(): Slice {
        return self.cellValue.beginParse();
    }
}
