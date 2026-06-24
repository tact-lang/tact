contract OptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;
    builderOpt: Builder?;
    sliceOpt: Slice?;
    strOpt: String?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.addrOpt = null;
        self.cellOpt = null;
        self.builderOpt = null;
        self.sliceOpt = null;
        self.strOpt = null;
    }
}