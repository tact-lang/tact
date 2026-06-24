contract ManyOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    stringOpt: String?;

    init() {
        self.intOpt = null;
        self.boolOpt = true;
        self.addrOpt = null;
        self.cellOpt = emptyCell();
        self.sliceOpt = emptyCell().asSlice();
        self.stringOpt = null;
    }
}