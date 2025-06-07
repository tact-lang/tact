contract LongPrimitives {
    a: Int = 0;
    b: Int = 1;
    c: Int = 2;
    d: Int = 3;
    e: Int = 4;
    f: Bool = false;
    g: String = "g";
    h: Bool? = null;
    i: Int? = null;
    j: String? = null;

    init() {
        self.a = 10;
        self.b = 11;
        self.c = 12;
        self.d = 13;
        self.e = 14;
        self.f = true;
        self.g = "changed";
        self.h = true;
        self.i = 42;
        self.j = "set";
    }
}