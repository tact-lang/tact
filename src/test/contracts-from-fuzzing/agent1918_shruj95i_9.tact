contract OptionalChain {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.optInt = null;
        self.optBool = false;
        self.optStr = null;
    }
}