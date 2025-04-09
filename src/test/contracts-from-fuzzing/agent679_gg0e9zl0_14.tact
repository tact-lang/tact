// Contract with a large number of primitive fields directly
contract TestContract {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int as uint8;
    h: Int as int16;
    i: Int as uint32;
    j: Int as int4;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "ok";
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = 2;
        self.h = -3;
        self.i = 4;
        self.j = -2;
    }
}