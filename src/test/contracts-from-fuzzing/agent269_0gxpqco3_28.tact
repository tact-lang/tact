contract AllOptional {
    a: Int? = null;
    b: Bool? = null;
    c: String? = null;
    d: Int? = null;
    e: String? = null;
    f: Bool? = null;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = 4;
        self.e = "e";
        self.f = false;
    }
}