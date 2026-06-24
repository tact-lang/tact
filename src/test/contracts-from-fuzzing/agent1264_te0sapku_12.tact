contract PrimitiveOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    stringOpt: String?;
    addressOpt: Address?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.cellOpt = null;
        self.sliceOpt = null;
        self.stringOpt = null;
        self.addressOpt = null;
    }
}
