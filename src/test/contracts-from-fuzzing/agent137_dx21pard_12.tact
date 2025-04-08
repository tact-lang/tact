contract LargeFlat {
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
        self.a = 0;
        self.b = false;
        self.c = "";
        self.d = myAddress();
        self.e = 1;
        self.f = true;
        self.g = "abc";
        self.h = myAddress();
        self.i = 2;
        self.j = false;
        self.k = "def";
        self.l = myAddress();
        self.m = 3;
        self.n = true;
    }
}
