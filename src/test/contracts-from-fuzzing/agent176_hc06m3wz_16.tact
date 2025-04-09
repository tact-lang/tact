contract MultipleOptionalPrimitives {
    a: Int? = null;
    b: Int? = 0;
    c: Bool? = null;
    d: Bool? = false;
    e: String? = null;
    f: String? = "";

    init() {
        self.a = 5;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = "hi";
        self.f = null;
    }
}