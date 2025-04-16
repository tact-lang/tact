contract ManyPrimitives {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: String;
    h: String?;

    init() {
        self.a = 1;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = myAddress();
        self.f = null;
        self.g = "x";
        self.h = "y";
    }
}
