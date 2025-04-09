contract PrimitivesOptionalMix {
    intOpt: Int?;
    boolOpt: Bool?;
    sliceOpt: Slice?;
    cellOpt: Cell?;
    addressOpt: Address?;
    stringOpt: String?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.sliceOpt = null;
        self.cellOpt = null;
        self.addressOpt = null;
        self.stringOpt = null;
    }
}