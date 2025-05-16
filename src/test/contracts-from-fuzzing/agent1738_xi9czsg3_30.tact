contract OptionalContainers {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    addressOpt: Address?;
    cellOpt: Cell?;
    sliceOpt: Slice?;

    init() {
        self.intOpt=null; self.boolOpt=null; self.stringOpt=null;
        self.addressOpt=null; self.cellOpt=null; self.sliceOpt=null;
    }
}