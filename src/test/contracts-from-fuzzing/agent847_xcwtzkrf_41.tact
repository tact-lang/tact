contract OptionalInitMix {
    a: Int?;
    b: Int = 7;
    c: Bool?;

    init() {
        self.a = null;
        self.c = null;
    }
}