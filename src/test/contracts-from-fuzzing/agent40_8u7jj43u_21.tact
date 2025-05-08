contract TestOptPrims {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.strOpt = null;
        self.addrOpt = null;
        self.cellOpt = null;
        self.sliceOpt = null;
    }

    receive() {
        let a = self.intOpt;
        let b = self.boolOpt;
        let c = self.strOpt;
        let d = self.addrOpt;
        let e = self.cellOpt;
        let f = self.sliceOpt;
    }
}