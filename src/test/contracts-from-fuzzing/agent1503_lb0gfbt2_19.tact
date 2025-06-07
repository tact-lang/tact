contract OptionalOnly {
    opt1: Bool?;
    opt2: Int?;
    opt3: Address?;

    init() {
        self.opt1 = null;
        self.opt2 = null;
        self.opt3 = null;
    }

    receive() {}
}