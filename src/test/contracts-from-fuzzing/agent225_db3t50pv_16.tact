contract OptionalStructFields {
    s: String?;
    c: Cell?;
    a: Address?;
    b: Bool?;
    i: Int?;

    init() {
        self.s = null;
        self.c = null;
        self.a = null;
        self.b = null;
        self.i = null;
    }
}