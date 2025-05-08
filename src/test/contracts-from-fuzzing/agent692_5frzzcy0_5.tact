contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int as int64;
    h: Int as uint32;
    i: Int as uint8;
    j: Bool;
    k: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = 64;
        self.h = 5;
        self.i = 255;
        self.j = false;
        self.k = "done";
    }
}