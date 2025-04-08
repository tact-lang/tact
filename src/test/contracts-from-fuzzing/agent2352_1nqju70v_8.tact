struct S { q: Int; }

contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: S?;
    e: Int?;
    f: Bool?;
    g: String?;
    h: S?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = "x";
        self.d = null;
        self.e = 5;
        self.f = true;
        self.g = null;
        self.h = S{ q: 9 };
    }
}