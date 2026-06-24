contract ManyPrimFields {
    a: Int = 0;
    b: Bool = false;
    c: String = "";
    d: Int? = null;
    e: Bool? = null;
    f: String? = null;
    g: Int = 12;
    h: Bool = true;
    i: String = "abc";
    j: Bool = false;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "x";
        self.d = 5;
        self.e = false;
        self.f = "str";
        self.g = 100;
        self.h = false;
        self.i = "changed";
        self.j = true;
    }
}
