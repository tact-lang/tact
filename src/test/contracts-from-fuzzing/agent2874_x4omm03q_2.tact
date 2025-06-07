contract TestContract {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    addressOpt: Address?;
    cellOpt: Cell?;

    init() {
        self.intOpt = 123;
        self.boolOpt = true;
        self.stringOpt = "hi";
        self.addressOpt = null;
        self.cellOpt = null;
    }
}
