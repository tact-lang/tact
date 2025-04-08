// Contract with persistent optional primitive fields initialized to null
contract NullOptionals {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
    optSlice: Slice?;
    optCell: Cell?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
        self.optAddr = null;
        self.optSlice = null;
        self.optCell = null;
    }
}