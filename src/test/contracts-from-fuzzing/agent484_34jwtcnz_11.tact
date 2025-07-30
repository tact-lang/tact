// Many optional fields at contract level
contract ManyOptionals {
    a: Int?;
    b: Bool?;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String?;

    init() {
        self.a = null;
        self.b = true;
        self.c = "x";
        self.d = 5;
        self.e = null;
        self.f = null;
    }
}