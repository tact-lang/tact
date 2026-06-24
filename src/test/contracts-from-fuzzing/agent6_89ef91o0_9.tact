contract LiteralDefaults {
    intField: Int = -123;
    boolField: Bool = true;
    strField: String = "hello";
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.optInt = 456;
        self.optBool = null;
        self.optStr = "world";
    }
}
