contract BigPersistent {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Int?;
    f: Bool?;
    g: String?;
    h: Address?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "abc";
        self.d = myAddress();
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = null;
    }
}
