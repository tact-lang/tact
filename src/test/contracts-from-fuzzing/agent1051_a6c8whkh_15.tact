contract TestContract {
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
    k: Bool;
    l: String;
    m: Address;
    n: Address;
    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = null;
        self.e = null;
        self.f = "f";
        self.g = 10;
        self.h = false;
        self.i = "i";
        self.j = 100;
        self.k = true;
        self.l = "l";
        self.m = myAddress();
        self.n = myAddress();
    }
}