contract ManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int? = null;
    e: Bool? = true;
    f: String? = null;

    init() {
        self.a = 10;
        self.b = true;
        self.c = "bye";
        self.d = 99;
        self.e = null;
        self.f = "abc";
    }
}