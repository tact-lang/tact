contract MixedOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.strOpt = null;
        self.addrOpt = null;
        self.cellOpt = null;
        self.sliceOpt = null;
    }
}