contract OptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    addressOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    stringOpt: String?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.addressOpt = null;
        self.cellOpt = null;
        self.sliceOpt = null;
        self.stringOpt = null;
    }
}