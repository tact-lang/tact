contract ManyFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Bool;
    g: Bool;
    h: String;
    i: String;
    j: Address;
    k: Address;
    l: Int;
    m: Int;
    n: Bool;
    o: String;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = true;
        self.g = false;
        self.h = "h";
        self.i = "i";
        self.j = myAddress();
        self.k = myAddress();
        self.l = 42;
        self.m = 43;
        self.n = false;
        self.o = "o";
    }
}