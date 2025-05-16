contract DefaultMix {
    nopt: Int;
    opt1: Int?;
    opt2: Bool?;
    opt3: Int?;
    nopt2: Bool;

    init() {
        self.nopt = 1;
        self.opt1 = null;
        self.opt2 = true;
        self.opt3 = 42;
        self.nopt2 = false;
    }
}