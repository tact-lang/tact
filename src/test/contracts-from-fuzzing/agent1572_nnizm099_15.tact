// Contract with a large number of unrelated primitive fields, mixed optional/default
contract ManyFields {
    a: Int = 0;
    b: Int = 1;
    c: String = "a";
    d: String = "b";
    e: Bool = true;
    f: Bool = false;
    g: Int? = null;
    h: Bool? = null;
    i: String? = null;
    j: Int = 2;
    k: Bool = true;
    l: String? = null;

    init() {
        self.a = 42;
        self.b = 24;
        self.c = "x";
        self.d = "y";
        self.e = false;
        self.f = true;
        self.g = 7;
        self.h = true;
        self.i = "maybe";
        self.j = 100;
        self.k = false;
        self.l = null;
    }
}
