// Contract with long list mixing optional and non-optional
contract MixedLongList {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Int?;
    i: Bool;
    j: Bool?;

    init() {
        self.a = 77;
        self.b = null;
        self.c = true;
        self.d = false;
        self.e = "hello";
        self.f = null;
        self.g = 99;
        self.h = null;
        self.i = false;
        self.j = true;
    }
}