contract EmptyOptionalVariants {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    cellOpt: Cell?;
    addrOpt: Address?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.stringOpt = null;
        self.cellOpt = null;
        self.addrOpt = null;
    }
}