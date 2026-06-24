contract ManyFields {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: Bool;
    f: Address;
    g: Int;
    h: Bool;
    i: Address;
    j: Int;
    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = true;
        self.e = false;
        self.f = myAddress();
        self.g = 7;
        self.h = true;
        self.i = myAddress();
        self.j = 99;
    }
}