// contract with empty init, large amount of persistent primitive fields
contract ManyPrim {
    a: Int as uint8;
    b: Int as uint32;
    c: Bool;
    d: Bool;
    e: String;
    f: String;
    g: Int;
    h: Int?;
    i: String?;
    j: Bool?;
    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = false;
        self.e = "alpha";
        self.f = "beta";
        self.g = 1234;
        self.h = null;
        self.i = null;
        self.j = null;
    }
}