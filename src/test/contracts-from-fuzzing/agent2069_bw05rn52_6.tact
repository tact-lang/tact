contract OptionalTest {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    strOpt: String?;
    sliceOpt: Slice?;
    cellOpt: Cell?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.addrOpt = null;
        self.strOpt = null;
        self.sliceOpt = null;
        self.cellOpt = null;
    }
}