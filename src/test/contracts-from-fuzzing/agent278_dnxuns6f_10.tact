contract OptionalPrimitiveFields {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    cellOpt: Cell?;
    addressOpt: Address?;
    sliceOpt: Slice?;
    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.stringOpt = null;
        self.cellOpt = null;
        self.addressOpt = null;
        self.sliceOpt = null;
    }
}