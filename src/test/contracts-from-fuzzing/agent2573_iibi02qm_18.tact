contract NullableMix {
    addrOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;
    intOpt: Int?;
    txtOpt: String?;

    init() {
        self.addrOpt = null;
        self.cellOpt = null;
        self.sliceOpt = null;
        self.intOpt = null;
        self.txtOpt = null;
    }
}