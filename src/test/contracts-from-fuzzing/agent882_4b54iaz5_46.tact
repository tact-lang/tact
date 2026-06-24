contract MultiOptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    cellOpt: Cell?;
    slOpt: Slice?;
    builderOpt: Builder?;
    strOpt: String?;
    addrOpt: Address?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.cellOpt = null;
        self.slOpt = null;
        self.builderOpt = null;
        self.strOpt = null;
        self.addrOpt = null;
    }
}