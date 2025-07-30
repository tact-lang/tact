contract OptionalFields {
    a: Int?;
    b: Bool?;
    c: Address?;
    s: Slice?;
    cellVal: Cell?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.s = null;
        self.cellVal = null;
    }
}