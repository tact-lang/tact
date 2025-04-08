contract OptionalsMixTest {
    intOpt: Int?;
    boolOpt: Bool?;
    addrOpt: Address?;
    sliceOpt: Slice?;
    cellOpt: Cell?;

    init() {
        self.intOpt = null;
        self.boolOpt = true;
        self.addrOpt = null;
        self.sliceOpt = null;
        self.cellOpt = null;
    }
}
