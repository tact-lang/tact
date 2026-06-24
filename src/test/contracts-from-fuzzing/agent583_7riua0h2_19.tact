contract MultiDefaultFields {
    a: Int = 1;
    b: Bool = true;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.a = 11;
        self.b = false;
        self.c = "bye";
        self.d = 22;
        self.e = true;
        self.f = "zzz";
    }
}