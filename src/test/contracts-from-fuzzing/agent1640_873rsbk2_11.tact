contract ManyVars {
    a: Int;
    b: Bool;
    c: String;
    d: Int as uint8;
    e: Bool?;
    f: Int?;
    g: String?;
    h: Int as int64;
    i: Bool;
    j: Int;
    k: String;
    l: Int as coins;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "hi";
        self.d = 2;
        self.e = null;
        self.f = 3;
        self.g = null;
        self.h = 4;
        self.i = false;
        self.j = 5;
        self.k = "there";
        self.l = 6;
    }
}