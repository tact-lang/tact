contract OptionalPrimitives {
    intOpt: Int?;
    addrOpt: Address?;
    boolOpt: Bool?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    strOpt: String?;

    init() {
        self.intOpt = null;
        self.addrOpt = null;
        self.boolOpt = null;
        self.cellOpt = null;
        self.sliceOpt = null;
        self.strOpt = null;
    }
}