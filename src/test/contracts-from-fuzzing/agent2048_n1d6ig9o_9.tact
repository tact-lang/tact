contract OptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    builderOpt: Builder?;

    init() {
        self.intOpt = 100;
        self.boolOpt = null;
        self.stringOpt = "hello";
        self.addrOpt = null;
        self.cellOpt = emptyCell();
        self.sliceOpt = null;
        self.builderOpt = beginCell();
    }
}
