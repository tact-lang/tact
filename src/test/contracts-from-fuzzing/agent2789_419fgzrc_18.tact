contract OptionalsWithDefaults {
    optInt: Int? = null;
    optBool: Bool? = false;

    init() {
        self.optInt = null;
        self.optBool = null;
    }
}
