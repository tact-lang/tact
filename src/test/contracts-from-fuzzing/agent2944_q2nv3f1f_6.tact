contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "one";
        self.d = null;
        self.e = false;
        self.f = null;
        self.g = 2;
        self.h = false;
        self.i = "two";
        self.j = 100;
    }
}