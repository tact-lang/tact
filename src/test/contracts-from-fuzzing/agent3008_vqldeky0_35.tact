contract ExplicitNils {
    a: Int? = null;
    b: String? = null;
    c: Bool? = null;
    d: Cell? = null;
    e: Slice? = null;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = null;
    }
}