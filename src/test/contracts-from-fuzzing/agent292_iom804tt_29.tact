contract ComplexOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Slice?;
    g: Builder?;

    init() {
        self.a = 42;
        self.b = null;
        self.c = "text";
        self.d = null;
        self.e = emptyCell();
        self.f = null;
        self.g = beginCell();
    }
}