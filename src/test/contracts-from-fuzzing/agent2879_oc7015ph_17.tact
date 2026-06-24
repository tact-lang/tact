contract Test {
    factor: Int as uint8;
    largeNum: Int as uint64;
    optStr: String?;
    optBool: Bool?;

    init() {
        self.factor = 5;
        self.largeNum = 123456789;
        self.optStr = null;
        self.optBool = true;
    }
}