contract InitOptionalDefaults {
    opt1: Int? = null;
    opt2: Bool? = null;

    init() {
        self.opt1 = 42;
        self.opt2 = true;
    }
}
