contract Test {
    a: Int = 1;
    b: Int as uint8 = 2;
    c: Bool = true;
    d: Int = 4;
    e: String?;
    f: Bool = false;
    g: Int as uint16 = 7;
    h: Int = 8;
    i: String?;
    j: Int as uint32 = 10;
    k: Bool = true;
    l: Int as coins = 11;
    m: Int = 12;
    n: Int as uint4 = 3;
    o: Bool = false;
    p: String?;

    init() {
        self.e = "a";
        self.i = "b";
        self.p = "c";
    }
}