// Large flat contract with many primitive fields
contract Flat {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Bool;
    h: Bool;
    i: Bool;
    j: Bool;
    k: String;
    l: String;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = 6;
        self.g = true;
        self.h = false;
        self.i = true;
        self.j = false;
        self.k = "hi";
        self.l = "world";
    }
}