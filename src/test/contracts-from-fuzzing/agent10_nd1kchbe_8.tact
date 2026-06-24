contract OptionalsEverywhere {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optStr: String?;

    init() {
        self.optInt = 1;
        self.optBool = true;
        self.optAddr = myAddress();
        self.optCell = emptyCell();
        self.optStr = "hello";
    }
}