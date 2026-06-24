contract ManyFields {
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
    init() {
        self.a = 1;
        self.b = false;
        self.c = "c";
        self.d = myAddress();
        self.e = 2;
        self.f = true;
        self.g = "g";
        self.h = myAddress();
        self.i = 3;
        self.j = true;
    }
}