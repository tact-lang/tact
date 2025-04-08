contract MultiOptionals {
    a: Int?;
    b: Bool?;
    c: Address?;
    d: String?;
    e: Cell?;
    f: Slice?;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = "hello";
        self.e = null;
        self.f = emptyCell().asSlice();
    }
}