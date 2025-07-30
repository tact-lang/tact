contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "c";
        self.d = 4;
        self.e = true;
        self.f = "f";
        self.g = 7;
        self.h = false;
        self.i = "i";
        self.j = 10;
    }

    receive() {
        self.a += 1;
        self.d += 1;
        self.g += 1;
        self.j += 1;
    }
}