contract OptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    addrOpt: Address?;
    sliceOpt: Slice?;
    cellOpt: Cell?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.strOpt = null;
        self.addrOpt = null;
        self.sliceOpt = null;
        self.cellOpt = null;
    }
}