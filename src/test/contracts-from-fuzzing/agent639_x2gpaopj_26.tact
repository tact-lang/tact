contract OptWithDefaults {
    optInt: Int? = null;
    optBool: Bool? = true;

    init() {
        self.optInt = 5;
        self.optBool = false;
    }
}