contract SequentialOptional {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;
    f: Int;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = null;
        self.e = null;
        self.f = 99;
    }
}