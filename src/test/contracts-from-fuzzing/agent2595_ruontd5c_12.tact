contract OptionalPrimLists {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Cell?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = "ok";
        self.d = null;
        self.e = null;
    }
}