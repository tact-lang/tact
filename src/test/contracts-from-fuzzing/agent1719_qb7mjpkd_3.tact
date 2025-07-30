contract ManyFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: String;
    e: Int;
    f: Bool?;
    g: String;
    h: Int?;
    i: Bool;
    j: String?;
    k: Bool;
    l: Int?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = "d";
        self.e = 2;
        self.f = false;
        self.g = "g";
        self.h = null;
        self.i = false;
        self.j = "maybe";
        self.k = true;
        self.l = 10;
    }
}