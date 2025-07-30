contract ManyDefaults {
    a: Int = 1;
    b: Bool = false;
    c: String = "hi";
    d: Int? = null;
    e: String? = null;
    f: Bool? = null;

    init() {
        self.a = 5;
        self.b = true;
        self.c = "bye";
        self.d = null;
        self.e = null;
        self.f = null;
    }
}