contract BigContract {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int;
    f: Bool;
    g: String;
    h: Address;
    i: Int;
    j: Bool;
    k: String;
    l: Address;
    m: Int;
    n: Bool;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "x";
        self.d = myAddress();
        self.e = 2;
        self.f = false;
        self.g = "y";
        self.h = myAddress();
        self.i = 3;
        self.j = true;
        self.k = "z";
        self.l = myAddress();
        self.m = 4;
        self.n = false;
    }
}