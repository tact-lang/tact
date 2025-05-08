contract MultiFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Int?;
    e: String;
    f: Bool?;
    g: String?;
    h: Int as uint32;
    i: Int as int16;
    j: Int as coins;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = null;
        self.e = "test";
        self.f = null;
        self.g = "hello";
        self.h = 100;
        self.i = -100;
        self.j = 5_000_000_000;
    }
}