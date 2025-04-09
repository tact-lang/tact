contract OptionalInitNull {
    opt1: Int? = null;
    opt2: Bool? = null;

    init() {
        self.opt1 = null;
        self.opt2 = true;
    }
}