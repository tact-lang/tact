contract OptionalPrimitiveFields {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    addrOpt: Address?;
    cellOpt: Cell?;

    init() {
        self.intOpt = null;
        self.boolOpt = true;
        self.strOpt = null;
        self.addrOpt = null;
        self.cellOpt = emptyCell();
    }
}