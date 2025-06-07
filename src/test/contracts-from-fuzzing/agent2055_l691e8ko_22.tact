contract OptionalToplevelPrimitives {
    i: Int?;
    b: Bool?;
    a: Address?;
    c: Cell?;

    init() {
        self.i = null;
        self.b = null;
        self.a = null;
        self.c = null;
    }
}
