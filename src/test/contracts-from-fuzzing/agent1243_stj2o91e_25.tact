contract TestContract {
    intOpt: Int? = null;
    boolOpt: Bool? = null;
    strOpt: String? = null;
    addrOpt: Address? = null;

    init() {
        self.intOpt = 123;
        self.boolOpt = true;
        self.strOpt = "hi";
        self.addrOpt = null;
    }

    receive() {
        dump(0);
    }
}