// Test contract with many optional primitive fields
contract ManyOptionalPrimitives {
    intOpt: Int?;
    boolOpt: Bool?;
    stringOpt: String?;
    sliceOpt: Slice?;
    cellOpt: Cell?;
    addressOpt: Address?;

    init() {
        self.intOpt = 10;
        self.boolOpt = null;
        self.stringOpt = null;
        self.sliceOpt = null;
        self.cellOpt = null;
        self.addressOpt = null;
    }
}