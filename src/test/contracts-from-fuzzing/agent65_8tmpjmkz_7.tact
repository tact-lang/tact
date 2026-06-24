contract LongList {
    a: Int;
    b: Int as uint8;
    c: Int as int64;
    d: Int as coins;
    e: Bool;
    f: Bool;
    g: Int?;
    h: Address;
    i: String;
    j: String?;
    k: Bool;
    l: Int as uint32;

    init() {
        self.a = -1;
        self.b = 255;
        self.c = -999;
        self.d = ton("0.1");
        self.e = false;
        self.f = true;
        self.g = null;
        self.h = myAddress();
        self.i = "Test";
        self.j = null;
        self.k = true;
        self.l = 4294967295; // max uint32
    }
}