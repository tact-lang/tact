contract ExplicitOptionalDefaults {
    intOpt: Int? = null;
    boolOpt: Bool? = null;
    addrOpt: Address? = null;
    cellOpt: Cell? = null;
    sliceOpt: Slice? = null;
    strOpt: String? = null;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.addrOpt = null;
        self.cellOpt = null;
        self.sliceOpt = null;
        self.strOpt = null;
    }
}