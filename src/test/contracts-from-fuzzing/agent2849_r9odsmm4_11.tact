contract ManyDefaults {
    a: Int = 1;
    b: Int = 2;
    c: Bool = false;
    d: Bool = true;
    e: String = "x";
    f: String = "y";

    init() {
        self.a = 3;
        self.b = 4;
        self.c = true;
        self.d = false;
        self.e = "z";
        self.f = "w";
    }
}