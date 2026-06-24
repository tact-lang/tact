contract OptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    addressOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;

    init() {
        self.intOpt = 1;
        self.boolOpt = false;
        self.addressOpt = null;
        self.cellOpt = null;
        self.sliceOpt = null;
    }
}