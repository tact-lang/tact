contract LongFieldsList {
    a: Int;
    b: Bool;
    c: Int;
    d: String;
    e: Address;
    f: Int;
    g: Bool;
    h: String;
    i: Int;
    j: Bool;

    init() {
        self.a = 1;
        self.b = false;
        self.c = 2;
        self.d = "D";
        self.e = myAddress();
        self.f = 3;
        self.g = true;
        self.h = "H";
        self.i = 4;
        self.j = false;
    }
}