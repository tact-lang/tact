// optional primitive fields
contract TestContract {
    intOpt: Int?;
    boolOpt: Bool?;
    sliceOpt: Slice?;
    cellOpt: Cell?;
    strOpt: String?;
    addressOpt: Address?;
    init() {
        self.intOpt = null;
        self.boolOpt = true;
        self.sliceOpt = null;
        self.cellOpt = emptyCell();
        self.strOpt = "hello";
        self.addressOpt = myAddress();
    }
}