contract LargePersistentPrimitives {
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

    init() {
        self.a = 1;
        self.b = false;
        self.c = "x";
        self.d = myAddress();
        self.e = 1;
        self.f = true;
        self.g = "q";
        self.h = myAddress();
        self.i = 5;
        self.j = true;
        self.k = "r";
        self.l = myAddress();
    }
}