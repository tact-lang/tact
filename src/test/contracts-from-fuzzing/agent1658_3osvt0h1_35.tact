contract OptionalsMix {
    a: Int?;
    b: Int = 3;
    c: Bool?;
    d: Bool = true;

    init() {
        self.a = null;
        self.c = null;
    }
}