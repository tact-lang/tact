contract DefaultOptionalCombined {
    intOpt: Int? = null;
    boolOpt: Bool? = null;
    strOpt: String? = null;

    init() {
        self.intOpt = 5;
        self.boolOpt = true;
        self.strOpt = "hello";
    }
}