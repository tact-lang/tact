contract OptionalMix {
    i: Int?;
    b: Bool?;
    s: String?;

    init() {
        self.i = 42;
        self.b = null;
        self.s = "hi";
    }
}
