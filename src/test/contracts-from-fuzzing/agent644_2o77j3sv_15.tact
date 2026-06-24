contract EmptyOptionalFields {
    a: Int?;
    b: Bool?;
    c: Cell?;
    d: Slice?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
    }
}