contract NullableAll {
    foo: Int?;
    bar: Bool?;
    addr: Address?;
    cellVal: Cell?;
    sliceVal: Slice?;
    builderVal: Builder?;
    strVal: String?;

    init() {
        self.foo = null;
        self.bar = null;
        self.addr = null;
        self.cellVal = null;
        self.sliceVal = null;
        self.builderVal = null;
        self.strVal = null;
    }
}
