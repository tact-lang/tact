contract OptionalsMix {
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    cellOpt: Cell?;
    sliceOpt: Slice?;

    init() {
        self.intOpt=null;
        self.boolOpt=null;
        self.strOpt=null;
        self.cellOpt=null;
        self.sliceOpt=null;
    }
}