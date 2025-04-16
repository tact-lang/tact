contract ManyFieldsPersistent {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "x";
        self.d = null;
        self.e = true;
        self.f = null;
        self.g = 7;
        self.h = true;
        self.i = "y";
        self.j = 100;
    }
}