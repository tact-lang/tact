contract Test {
    a: Int;
    b: Int as uint16;
    c: Int as int1;
    d: Bool;
    e: String;
    f: Int?;
    g: String?;
    h: Bool?;

    init() {
        self.a = -123;
        self.b = 65535;
        self.c = -1;
        self.d = false;
        self.e = "zzz";
        self.f = 999;
        self.g = null;
        self.h = null;
    }
}