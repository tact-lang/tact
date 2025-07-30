contract ComboOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    strOpt: String?;
    nestedOpt: Inner?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.addrOpt = null;
        self.cellOpt = null;
        self.sliceOpt = null;
        self.strOpt = null;
        self.nestedOpt = null;
    }
}

struct Inner {
    x: Int;
}