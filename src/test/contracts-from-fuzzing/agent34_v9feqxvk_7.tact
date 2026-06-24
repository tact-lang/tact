contract OptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    addrOpt: Address?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.strOpt = null;
        self.cellOpt = null;
        self.sliceOpt = null;
        self.addrOpt = null;
    }
}