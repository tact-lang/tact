contract ExplicitNulls {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Slice? = null;
    e: Cell? = null;
    f: Address? = null;

    init() {
        self.a = 17;
        self.b = false;
        self.c = "yes";
        self.d = null;
        self.e = null;
        self.f = null;
    }
}
