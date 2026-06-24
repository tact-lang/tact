contract GetterSliceFixed {
    cell: Cell;

    init() {
        self.cell = beginCell().storeUint(100, 16).endCell();
    }

    receive() {}

    get fun getSlice(): Slice {
        return self.cell.beginParse();
    }
}
