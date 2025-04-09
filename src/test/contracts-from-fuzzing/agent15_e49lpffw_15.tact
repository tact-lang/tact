// deeply nested contract persistent fields
contract NestedAgain {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int;
    f: Bool;
    g: Int?;
    h: Bool?;
    i: Int;
    j: Bool;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = false;
        self.e = 5;
        self.f = true;
        self.g = null;
        self.h = null;
        self.i = 10;
        self.j = false;
    }
}