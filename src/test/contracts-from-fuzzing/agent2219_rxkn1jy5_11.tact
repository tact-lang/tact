struct Substruct { v: Int; }

contract ListOrder {
    a: Int;
    b: Bool;
    c: String;
    d: Substruct;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Substruct;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "x";
        self.d = Substruct{ v: 7 };
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = Substruct{ v: 77 };
    }
}