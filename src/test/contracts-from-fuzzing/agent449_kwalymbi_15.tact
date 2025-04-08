contract TestContract {
    a: Int as uint8 = 1;
    b: Int as int8 = -1;
    c: Int as uint64 = 123456789;
    d: Int as int64 = -123456789;
    e: Bool = true;
    f: String = "s";
    g: Int? = null;
    h: String? = null;
    i: Bool? = null;

    init() {
        self.a = 2;
        self.b = -2;
        self.c = 987654321;
        self.d = -987654321;
        self.e = false;
        self.f = "x";
        self.g = 3;
        self.h = "opt";
        self.i = true;
    }
}
