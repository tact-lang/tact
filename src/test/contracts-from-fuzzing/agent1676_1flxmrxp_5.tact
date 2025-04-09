contract OptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;
    stringOpt: String?;

    init() {
        self.intOpt = null;
        self.boolOpt = true;
        self.addrOpt = null;
        self.cellOpt = null;
        self.stringOpt = null;
    }
}