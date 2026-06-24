contract AllOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    builderOpt: Builder?;
    stringOpt: String?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.addrOpt = null;
        self.cellOpt = null;
        self.sliceOpt = null;
        self.builderOpt = null;
        self.stringOpt = null;
    }
}