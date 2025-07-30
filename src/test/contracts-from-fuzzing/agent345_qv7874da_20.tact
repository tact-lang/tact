contract OptionalDefaults {
    opt1: Int? = null;
    opt2: String? = null;
    opt3: Bool? = null;

    init() {
        self.opt1 = 42;
        self.opt2 = "hi";
        self.opt3 = true;
    }
}