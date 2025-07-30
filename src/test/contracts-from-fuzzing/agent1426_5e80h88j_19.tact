contract OptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    sliceOpt: Slice?;
    cellOpt: Cell?;
    builderOpt: Builder?;
    strOpt: String?;

    init() {
        self.intOpt = null;
        self.boolOpt = true;
        self.addrOpt = null;
        self.sliceOpt = null;
        self.cellOpt = null;
        self.builderOpt = null;
        self.strOpt = null;
    }
}