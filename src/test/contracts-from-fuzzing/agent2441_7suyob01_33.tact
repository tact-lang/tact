contract OptAfterPlain {
    plain1: Int;
    plain2: Int;
    opt1: Int?;
    opt2: Int?;

    init() {
        self.plain1 = 1;
        self.plain2 = 2;
        self.opt1 = null;
        self.opt2 = null;
    }
}