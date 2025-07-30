contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool;
    f: String;
    g: Int;
    h: Bool;
    i: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "foo";
        self.d = null;
        self.e = false;
        self.f = "bar";
        self.g = 7;
        self.h = true;
        self.i = "baz";
    }
}