contract MixedOptionalsDefaults {
    a: Int? = null;
    b: Bool? = true;
    c: String? = "abc";
    d: Int = 42;
    e: Bool = false;
    f: String = "z";

    init() {
        self.a = 7;
        self.b = null;
        self.c = null;
        self.d = 10;
        self.e = true;
        self.f = "changed";
    }
}
