contract ManyOptionalsPrimitives {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Bool?;
    e: Bool?;
    f: Bool?;
    g: String?;
    h: String?;
    i: String?;

    init() {
        self.a = null; self.b = 2; self.c = 3;
        self.d = true; self.e = null; self.f = false;
        self.g = "x"; self.h = null; self.i = "y";
    }
}
