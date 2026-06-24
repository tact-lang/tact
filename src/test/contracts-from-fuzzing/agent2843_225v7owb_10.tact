contract Test10 {
    a: Int as int64;
    b: Int as uint32;
    c: Int as coins;
    d: Bool;
    e: String;
    f: Address;
    g: Int?;
    h: String?;
    i: Bool?;

    init() {
        self.a = -1234567890123;
        self.b = 1234567890;
        self.c = ton("1");
        self.d = true;
        self.e = "hello";
        self.f = myAddress();
        self.g = null;
        self.h = null;
        self.i = null;
    }
}