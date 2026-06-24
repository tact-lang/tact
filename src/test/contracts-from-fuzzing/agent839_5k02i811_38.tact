contract MixDefaults {
    a: Int = 1;
    b: Int? = null;
    c: String = "s";
    d: String? = null;
    e: Bool = false;
    f: Bool? = null;
    init() {
        self.a = 2;
        self.b = 3;
        self.c = "t";
        self.d = "u";
        self.e = true;
        self.f = true;
    }
}