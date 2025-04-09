contract OptAddrCellSlice {
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    text: String?;

    init() {
        self.optAddr = null;
        self.optCell = null;
        self.optSlice = null;
        self.text = null;
    }
}