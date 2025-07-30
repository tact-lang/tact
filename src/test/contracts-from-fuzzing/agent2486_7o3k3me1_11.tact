contract NilDefaults {
    optBool: Bool?;
    optInt: Int?;
    optStr: String?;

    init() {
        self.optBool = null;
        self.optInt = null;
        self.optStr = null;
    }
}