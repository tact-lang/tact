contract ManyOptionalPrimitives {
    i: Int?;
    b: Bool?;
    addr: Address?;
    str: String?;
    cellVal: Cell?;
    builderVal: Builder?;
    sliceVal: Slice?;

    init() {
        self.i = null;
        self.b = null;
        self.addr = null;
        self.str = null;
        self.cellVal = null;
        self.builderVal = null;
        self.sliceVal = null;
    }
}