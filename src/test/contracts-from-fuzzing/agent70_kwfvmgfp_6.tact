contract ManyFields {
    a: Int = 1;
    b: Int = 2;
    c: Int = 3;
    d: Int = 4;
    e: Int = 5;
    f: Bool = false;
    g: Bool = true;
    h: String = "h";
    i: String = "i";
    j: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    k: Address = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
    l: Bool = false;

    init() {
        self.a = 10;
        self.b = 20;
        self.c = 30;
        self.d = 40;
        self.e = 50;
        self.f = true;
        self.g = false;
        self.h = "hh";
        self.i = "ii";
        self.j = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.k = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.l = true;
    }

    receive() {
        self.a = 100;
    }
}