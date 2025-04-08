contract ScalarOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;

    init() {
        self.intOpt = 42;
        self.boolOpt = null;
        self.strOpt = "text";
    }
}