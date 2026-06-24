contract TestContract {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Int;
    g: Bool;
    h: Bool;
    i: Address;
    j: String;
    k: String;
    l: Address;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = 6;
        self.g = true;
        self.h = false;
        self.i = myAddress();
        self.j = "hello";
        self.k = "world";
        self.l = myAddress();
    }
}