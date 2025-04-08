contract TestContract {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Bool;
    f: Int;
    g: String;
    h: Address;
    i: Int;
    j: Bool;
    k: String;
    l: Int;
    m: String;
    n: Address;
    o: Bool;
    p: Int;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "abc";
        self.e = false;
        self.f = 2;
        self.g = "def";
        self.h = myAddress();
        self.i = 3;
        self.j = true;
        self.k = "ghi";
        self.l = 4;
        self.m = "jkl";
        self.n = myAddress();
        self.o = false;
        self.p = 5;
    }
}