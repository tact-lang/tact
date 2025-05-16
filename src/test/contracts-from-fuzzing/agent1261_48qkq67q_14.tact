contract ManyDefaults {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;

    init() {
        self.a = 5;
        self.b = true;
        self.c = "abc";
        self.d = 10;
        self.e = true;
        self.f = "hi";
    }
}