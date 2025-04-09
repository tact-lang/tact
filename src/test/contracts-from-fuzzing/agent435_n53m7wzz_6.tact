contract ManyOptionals {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    sliceOpt: Slice?;

    init() {
        self.intOpt = null;
        self.boolOpt = null;
        self.strOpt = null;
        self.sliceOpt = null;
    }
}