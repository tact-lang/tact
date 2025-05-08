contract OptionalDefaults {
    strOpt: String? = null;
    intOpt: Int? = null;
    boolOpt: Bool? = null;
    addrOpt: Address? = null;

    init() {
        self.strOpt = null;
        self.intOpt = null;
        self.boolOpt = null;
        self.addrOpt = null;
    }
}