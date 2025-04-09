contract OptionalPrimitiveFields {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    strOpt: String?;
    cellOpt: Cell?;
    sliceOpt: Slice?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.addrOpt = null;
        self.strOpt = null;
        self.cellOpt = null;
        self.sliceOpt = null;
    }
}