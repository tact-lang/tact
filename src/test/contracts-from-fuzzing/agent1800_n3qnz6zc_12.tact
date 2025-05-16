contract OptionalDefaults {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.optInt = 123;
        self.optBool = null;
        self.optStr = "hello";
    }
}