contract Opts {
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optStr: String?;

    init() {
        self.optInt = 11;
        self.optBool = true;
        self.optAddr = null;
        self.optCell = emptyCell();
        self.optStr = null;
    }
}