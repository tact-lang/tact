contract OptionalPrimitiveTest {
    a: Int?;
    b: Bool?;
    c: Address?;
    s: String?;
    cellVal: Cell?;
    builderVal: Builder?;
    sliceVal: Slice?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.s = null;
        self.cellVal = null;
        self.builderVal = null;
        self.sliceVal = null;
    }
}
