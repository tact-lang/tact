contract LongList {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Address?;
    i: Int;
    j: Bool;
    k: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "c";
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = myAddress();
        self.h = null;
        self.i = 2;
        self.j = false;
        self.k = "k";
    }
}