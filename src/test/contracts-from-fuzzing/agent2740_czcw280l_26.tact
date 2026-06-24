contract MixExplicitDefaults {
    a: Int = 1;
    b: Int? = null;
    c: Bool = true;
    d: Bool? = null;
    e: String = "ok";
    f: String? = null;

    init() {
        self.a = 10;
        self.b = null;
        self.c = false;
        self.d = true;
        self.e = "changed";
        self.f = null;
    }
}