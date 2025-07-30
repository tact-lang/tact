contract PrimitiveOptFields {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    addressOpt: Address?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.strOpt = null;
        self.cellOpt = null;
        self.sliceOpt = null;
        self.addressOpt = null;
    }
}