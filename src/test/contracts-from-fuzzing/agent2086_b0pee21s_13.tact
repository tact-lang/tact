contract OptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    addressOpt: Address?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.stringOpt = null;
        self.cellOpt = null;
        self.sliceOpt = null;
        self.addressOpt = null;
    }
}