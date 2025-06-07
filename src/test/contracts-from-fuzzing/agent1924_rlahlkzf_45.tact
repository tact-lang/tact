contract OptionalDefaultMix {
    a: Int?;
    b: Int? = null;
    c: Bool?;
    d: Bool? = null;
    s: String? = null;

    init() {
        self.a = null;
        self.c = null;
    }
}