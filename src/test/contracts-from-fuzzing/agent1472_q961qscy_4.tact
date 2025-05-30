contract OptionalOnly {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
    }
}
