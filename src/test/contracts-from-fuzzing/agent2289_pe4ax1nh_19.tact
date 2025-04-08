contract OptionWrap {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optStr: String?;
    optCell: Cell?;
    optSlice: Slice?;

    init() {
        self.optInt = 5;
        self.optBool = false;
        self.optAddr = myAddress();
        self.optStr = "hi";
        self.optCell = emptyCell();
        self.optSlice = self.optCell.asSlice();
    }
}