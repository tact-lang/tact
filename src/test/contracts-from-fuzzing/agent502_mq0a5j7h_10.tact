contract OptionalMixed {
    a: Int?;
    b: Bool;
    c: String?;
    d: Address;
    e: Cell?;
    f: Slice;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = myAddress();
        self.e = null;
        self.f = emptyCell().asSlice();
    }
}