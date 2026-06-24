contract TestSlice {
    someCell: Cell;

    init() {
        self.someCell = beginCell().storeUint(42, 32).endCell();
    }

    receive() {}

    get fun getSlice(): Slice {
        return self.someCell.beginParse();
    }
}
