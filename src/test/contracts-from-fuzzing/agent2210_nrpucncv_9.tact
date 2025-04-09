contract ManyOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Bool?;
    f: Bool?;
    g: Address?;
    h: String?;

    init() {
        self.a = null;
        self.b = 1;
        self.c = null;
        self.d = -5;
        self.e = true;
        self.f = null;
        self.g = myAddress();
        self.h = null;
    }
}