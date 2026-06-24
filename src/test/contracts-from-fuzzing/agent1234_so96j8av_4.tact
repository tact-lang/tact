contract ManyVars {
    a: Int;
    b: Bool;
    c: Address;
    d: Int?;
    e: Bool?;
    f: Address?;
    g: Int;
    h: Bool;
    i: Address;
    j: Int?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = null;
        self.e = false;
        self.f = null;
        self.g = 2;
        self.h = false;
        self.i = myAddress();
        self.j = 3;
    }
}