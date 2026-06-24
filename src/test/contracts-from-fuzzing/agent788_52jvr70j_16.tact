struct Rec {
    x: Int;
}

contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Int as uint32;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
    k: Bool;
    l: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = 42;
        self.e = false;
        self.f = "f";
        self.g = 7;
        self.h = true;
        self.i = "i";
        self.j = -1;
        self.k = false;
        self.l = "l";
    }
}