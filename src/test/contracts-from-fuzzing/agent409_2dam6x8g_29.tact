contract OnlyOpts {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    builderOpt: Builder?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.strOpt = null;
        self.addrOpt = null;
        self.cellOpt = null;
        self.sliceOpt = null;
        self.builderOpt = null;
    }
}