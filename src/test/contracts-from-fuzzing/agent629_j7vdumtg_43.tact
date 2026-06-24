contract OptionalAfterDefault {
    a: Int = 4;
    b: Int? = null;
    c: String = "s";
    d: String? = null;
    e: Bool = true;
    f: Bool? = null;

    init() {
        self.a = 7;
        self.b = 10;
        self.c = "hi";
        self.d = "bye";
        self.e = false;
        self.f = true;
    }
}