contract BigOptionalMix {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    builderOpt: Builder?;
    sliceOpt: Slice?;
    cellOpt: Cell?;
    addressOpt: Address?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.stringOpt = null;
        self.builderOpt = null;
        self.sliceOpt = null;
        self.cellOpt = null;
        self.addressOpt = null;
    }
}