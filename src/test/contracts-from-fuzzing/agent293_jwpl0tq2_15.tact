contract OptionalWithDefault {
    optStr: String? = null;
    optBool: Bool? = null;

    init() {
        self.optStr = null;
        self.optBool = null;
    }
}