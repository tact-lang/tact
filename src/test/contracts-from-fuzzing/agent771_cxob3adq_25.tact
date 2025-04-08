contract OptionDefault {
    opt1: Int? = null;
    opt2: Int? = null;
    opt3: String? = null;
    opt4: Bool? = null;

    init() {
        self.opt1 = 11;
        self.opt2 = 22;
        self.opt3 = "hello";
        self.opt4 = true;
    }
}