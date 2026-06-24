contract ManyFields {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int;
    h: Bool;
    i: String;
    j: Bool;
    k: Address;
    l: Bool;

    init() {
        self.a = 1;
        self.b = true;
        self.c = 2;
        self.d = false;
        self.e = 3;
        self.f = true;
        self.g = 4;
        self.h = false;
        self.i = "test";
        self.j = true;
        self.k = myAddress();
        self.l = false;
    }
}
