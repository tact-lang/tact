contract ChainedOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Cell?;
    e: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }

    receive() {}
}