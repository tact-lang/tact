contract MixedDirect {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: String?;
    f: Bool?;
    g: Bool;
    h: Int as uint8;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hello";
        self.d = null;
        self.e = "world";
        self.f = null;
        self.g = false;
        self.h = 255;
    }
}