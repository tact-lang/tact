contract LargeOptionals {
    a: Int?;
    b: String?;
    c: Bool?;
    d: Address?;
    e: Int?;
    f: String?;
    g: Bool?;
    h: Address?;

    init() {
        self.a = null;
        self.b = null;
        self.c = null;
        self.d = null;
        self.e = 1;
        self.f = "hi";
        self.g = true;
        self.h = myAddress();
    }
}