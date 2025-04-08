contract ManyPrimitives {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Bool;
    g: Bool;
    h: Bool;
    i: Address;
    j: Address;
    k: String;
    l: String;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = true;
        self.g = false;
        self.h = true;
        self.i = myAddress();
        self.j = myAddress();
        self.k = "foo";
        self.l = "bar";
    }
}