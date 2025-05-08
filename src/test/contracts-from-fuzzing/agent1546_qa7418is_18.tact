contract OptionalNoDefaults {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    cellOpt: Cell?;
    addrOpt: Address?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.strOpt = null;
        self.cellOpt = null;
        self.addrOpt = null;
    }
}
