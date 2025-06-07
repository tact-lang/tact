contract OptionalsDefault {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
        self.optAddr = null;
    }
}