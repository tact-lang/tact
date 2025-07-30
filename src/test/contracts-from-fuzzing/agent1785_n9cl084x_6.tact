contract OptionalManyTypes {
    intOpt: Int?;
    boolOpt: Bool?;
    addressOpt: Address?;
    cellOpt: Cell?;
    strOpt: String?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.addressOpt = null;
        self.cellOpt = null;
        self.strOpt = null;
    }
}