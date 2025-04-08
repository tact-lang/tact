contract OptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;
    strOpt: String?;

    init() {
        self.intOpt = 7;
        self.boolOpt = false;
        self.addrOpt = myAddress();
        self.cellOpt = emptyCell();
        self.strOpt = "test";
    }
}