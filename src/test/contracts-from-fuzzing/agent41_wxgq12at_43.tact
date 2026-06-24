contract NullableCellSliceAddress {
    optCell: Cell?;
    optSlice: Slice?;
    optAddr: Address?;

    init() {
        self.optCell = emptyCell();
        self.optSlice = null;
        self.optAddr = null;
    }
}
