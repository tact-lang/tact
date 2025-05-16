contract FlatOptionalMix {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;

    init() {
        self.a = 5;
        self.b = true;
        self.c = null;
        self.d = null;
    }
}