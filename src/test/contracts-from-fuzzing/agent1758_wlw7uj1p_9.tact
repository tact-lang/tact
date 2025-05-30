contract Optionals {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;

    init() {
        self.optInt = 123;
        self.optBool = true;
        self.optStr = "hello";
        self.optAddr = null;
        self.optCell = null;
        self.optSlice = null;
    }
}