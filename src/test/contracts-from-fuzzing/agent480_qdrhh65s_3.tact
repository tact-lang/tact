contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Bool;
    f: Int;
    g: Bool;
    h: Address;
    i: String;
    j: Bool;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = myAddress();
        self.e = false;
        self.f = -5;
        self.g = true;
        self.h = myAddress();
        self.i = "test";
        self.j = false;
    }
}