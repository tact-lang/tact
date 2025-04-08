contract OptionalDefaults {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optStr: String?;

    init() {
        self.optInt = 42;
        self.optBool = true;
        self.optAddr = myAddress();
        self.optCell = emptyCell();
        self.optSlice = emptyCell().asSlice();
        self.optStr = "hello";
    }
}