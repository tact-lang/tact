contract OptionalFieldVariants {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    builderOpt: Builder?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.stringOpt = null;
        self.addrOpt = null;
        self.cellOpt = null;
        self.sliceOpt = null;
        self.builderOpt = null;
    }
}
