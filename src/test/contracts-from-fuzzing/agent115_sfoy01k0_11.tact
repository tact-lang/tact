contract OptPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    strOpt: String?;

    init() {
        self.intOpt = null;
        self.boolOpt = true;
        self.addrOpt = null;
        self.cellOpt = emptyCell();
        self.sliceOpt = self.cellOpt!!.asSlice();
        self.strOpt = "optional";
    }
}
