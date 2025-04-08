contract JustOptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    addressOpt: Address?;
    stringOpt: String?;
    sliceOpt: Slice?;
    cellOpt: Cell?;

    init() {
        self.intOpt = null;
        self.boolOpt = true;
        self.addressOpt = myAddress();
        self.stringOpt = null;
        self.sliceOpt = emptyCell().asSlice();
        self.cellOpt = emptyCell();
    }
}