// Contract with many optional fields
contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int?;
    h: Bool?;
    i: String?;

    init() {
        self.a = null;
        self.b = true;
        self.c = "x";
        self.d = 1;
        self.e = false;
        self.f = "y";
        self.g = null;
        self.h = false;
        self.i = null;
    }
}
