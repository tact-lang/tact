contract OptionalDefaultChain {
    a: Int? = null;
    b: Int? = null;
    c: Bool? = null;
    d: String? = null;

    init() {
        self.a = 2;
        self.b = null;
        self.c = true;
        self.d = null;
    }
}
