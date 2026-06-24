contract Combination {
    intField: Int as int17;
    boolField: Bool;
    optAddr: Address?;
    optStr: String?;
    init() {
        self.intField = 12345;
        self.boolField = true;
        self.optAddr = null;
        self.optStr = null;
    }
}