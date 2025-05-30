contract OptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;
    strOpt: String?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.addrOpt = null;
        self.cellOpt = null;
        self.strOpt = null;
    }
}
