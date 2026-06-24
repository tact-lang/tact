contract OptionalBasicTypes {
    intOpt: Int?;
    boolOpt: Bool?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    builderOpt: Builder?;
    stringOpt: String?;
    addressOpt: Address?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.cellOpt = null;
        self.sliceOpt = null;
        self.builderOpt = null;
        self.stringOpt = null;
        self.addressOpt = null;
    }
}