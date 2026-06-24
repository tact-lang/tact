contract OptionalPersistence {
    intField: Int = 5;
    strOpt: String?;
    sliceOpt: Slice?;
    addrOpt: Address?;
    boolOpt: Bool?;

    init() {
        self.strOpt = null;
        self.sliceOpt = null;
        self.addrOpt = null;
        self.boolOpt = null;
    }
}