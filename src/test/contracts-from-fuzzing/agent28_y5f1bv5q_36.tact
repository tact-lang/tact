contract ScalarOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    sliceOpt: Slice?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.stringOpt = null;
        self.sliceOpt = null;
    }
}