contract EdgeOptional {
    s: String?;
    b: Bool?;
    i: Int?;
    a: Address?;
    c: Cell?;

    init() {
        self.s = null;
        self.b = null;
        self.i = null;
        self.a = null;
        self.c = null;
    }
}
