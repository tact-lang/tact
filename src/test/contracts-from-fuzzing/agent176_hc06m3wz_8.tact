contract OptionalPrimitive {
    optInt: Int? = null;
    optBool: Bool? = true;
    optStr: String? = null;

    init() {
        self.optInt = 5;
        self.optBool = null;
        self.optStr = "hello";
    }
}