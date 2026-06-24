contract OptsContract {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    strOpt: String?;
    cellOpt: Cell?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.addrOpt = null;
        self.strOpt = null;
        self.cellOpt = null;
    }
}