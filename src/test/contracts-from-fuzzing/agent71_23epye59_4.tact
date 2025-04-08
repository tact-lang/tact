contract OptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    stringOpt: String?;
    cellOpt: Cell?;
    sliceOpt: Slice?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.addrOpt = null;
        self.stringOpt = null;
        self.cellOpt = null;
        self.sliceOpt = null;
    }
}