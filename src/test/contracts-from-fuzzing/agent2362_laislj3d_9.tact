contract OptionalPrimitives {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.optInt = 7;
        self.optBool = null;
        self.optStr = "Test";
    }
}