contract ManyPersistent {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;

    init() {
        self.a = 0;
        self.b = null;
        self.c = true;
        self.d = null;
        self.e = "x";
        self.f = null;
        self.g = myAddress();
        self.h = null;
    }
}