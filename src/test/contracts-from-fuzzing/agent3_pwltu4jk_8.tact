// Many optional primitive fields in contract
contract OptPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    addrOpt: Address?;

    init() {
        self.intOpt = 5;
        self.boolOpt = null;
        self.stringOpt = null;
        self.cellOpt = emptyCell();
        self.sliceOpt = emptyCell().asSlice();
        self.addrOpt = myAddress();
    }
}