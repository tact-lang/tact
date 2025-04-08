// test multiple optional contracts - illegal in Tact type system?
contract OptsEverywhere {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Address?;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;
    i: Int?;
    j: Int?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = 5;
        self.f = false;
        self.g = "hello";
        self.h = null;
        self.i = -42;
        self.j = null;
    }
}
