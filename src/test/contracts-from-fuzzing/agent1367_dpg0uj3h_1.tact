contract EmptyOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    sliceOpt: Slice?;
    cellOpt: Cell?;
    stringOpt: String?;
    
    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.addrOpt = null;
        self.sliceOpt = null;
        self.cellOpt = null;
        self.stringOpt = null;
    }
}