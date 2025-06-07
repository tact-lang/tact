contract Test {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Bool;
    g: Bool;
    h: Address;
    i: Address;
    j: Bool;

    init() {
        self.a = 11;
        self.b = 12;
        self.c = 13;
        self.d = 14;
        self.e = 15;
        self.f = false;
        self.g = true;
        self.h = myAddress();
        self.i = myAddress();
        self.j = true;
    }
}