contract Optionals {
    
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    builderOpt: Builder?;
    addrOpt: Address?;
    
    init() {
        self.intOpt = null;
        self.boolOpt = true;
        self.stringOpt = null;
        self.cellOpt = emptyCell();
        self.sliceOpt = emptyCell().asSlice();
        self.builderOpt = beginCell();
        self.addrOpt = null;
    }
}
