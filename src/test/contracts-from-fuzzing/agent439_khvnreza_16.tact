contract Test16 {
    optStr: String?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optBool: Bool?;
    optInt: Int?;

    init() {
        self.optStr = null;
        self.optAddr = null;
        self.optCell = null;
        self.optSlice = null;
        self.optBool = null;
        self.optInt = null;
    }

    receive() {}
}