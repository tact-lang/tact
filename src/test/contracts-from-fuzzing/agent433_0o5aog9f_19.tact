contract TestContract {
    intOpt: Int? = null;
    boolOpt: Bool? = null;
    strOpt: String? = null;

    init() {
        self.intOpt = 42;
        self.boolOpt = true;
        self.strOpt = "hello";
    }
}