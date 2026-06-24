// very large flat contract storage with mixed types
contract TestContract {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: String;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int;
    k: Bool?;
    l: String;
    m: Int?;
    n: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = false;
        self.e = "alpha";
        self.f = "beta";
        self.g = 7;
        self.h = false;
        self.i = "gamma";
        self.j = 42;
        self.k = null;
        self.l = "delta";
        self.m = 101;
        self.n = "epsilon";
    }

    receive() {
        self.a = 2;
        self.b = false;
        self.c = 3;
        self.d = null;
        self.e = "A";
        self.f = "B";
        self.g = 8;
        self.h = true;
        self.i = "C";
        self.j = 43;
        self.k = true;
        self.l = "D";
        self.m = null;
        self.n = "E";
    }
}