contract MultiOptionalPrimitives {
    addrOpt: Address?;
    cellOpt: Cell?;
    strOpt: String?;

    init() {
        self.addrOpt = myAddress();
        self.cellOpt = emptyCell();
        self.strOpt = "opt";
    }
}