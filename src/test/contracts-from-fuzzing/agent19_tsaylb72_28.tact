contract OptsWithDefaults {
    optInt: Int? = null;
    optBool: Bool? = null;
    optStr: String? = null;

    init() {
        self.optInt = 50;
        self.optBool = true;
        self.optStr = "filled";
    }
}
