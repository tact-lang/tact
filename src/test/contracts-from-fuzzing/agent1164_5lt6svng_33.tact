contract OptionalMix {
    intOpt: Int?;
    boolN: Bool?;
    sliceOpt: Slice?;
    addressOpt: Address?;
    stringOpt: String?;

    init() {
        self.intOpt = null;
        self.boolN = true;
        self.sliceOpt = emptyCell().asSlice();
        self.addressOpt = null;
        self.stringOpt = null;
    }
}