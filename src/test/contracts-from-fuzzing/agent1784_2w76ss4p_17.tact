contract ManyDirect {
    a: Int = 1;
    b: Bool = false;
    c: String = "h";
    d: Int? = null;
    e: Bool? = true;
    f: String? = null;
    g: Int as uint8 = 5;
    h: Int as int4 = -2;

    init() {
        self.a = 2;
        self.b = true;
        self.c = "hi";
        self.d = null;
        self.e = false;
        self.f = "hello";
        self.g = 7;
        self.h = -1;
    }
}