contract OptionalIntVar {
    intOpt: Int?;

    init() {
        self.intOpt = null;
        self.intOpt = 5;
        self.intOpt = null;
    }
}