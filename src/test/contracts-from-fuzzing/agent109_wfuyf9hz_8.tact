contract Test {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int as int64;
    h: Int as uint32;
    i: Int as coins;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hello";
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = 123;
        self.h = 42;
        self.i = 1000000;
    }
}
