contract MixedOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;

    init() {
        self.intOpt = null;
        self.boolOpt = false;
        self.strOpt = "hello";
        self.addrOpt = null;
        self.cellOpt = emptyCell();
        self.sliceOpt = emptyCell().asSlice();
    }
}