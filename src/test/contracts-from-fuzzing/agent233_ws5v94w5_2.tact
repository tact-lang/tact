contract OptFields {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.addrOpt = null;
        self.cellOpt = null;
    }
}
