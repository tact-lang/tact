contract OptionalPrimitive {
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;

    init() {
        self.optInt = 1;
        self.optBool = false;
        self.optStr = "test";
    }
}