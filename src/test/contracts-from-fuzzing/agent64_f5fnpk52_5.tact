contract ManyPrimitiveFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool;
    f: String;
    g: Int?;
    h: Bool;
    i: String;
    j: Int;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = null;
        self.e = false;
        self.f = "f";
        self.g = null;
        self.h = true;
        self.i = "i";
        self.j = 42;
    }

    receive() {
        self.a += 1;
    }
}