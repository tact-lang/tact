contract OptionalShuffled {
    a: Int?;
    b: Bool;
    c: Bool?;
    d: Int;

    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = 123;
    }
}