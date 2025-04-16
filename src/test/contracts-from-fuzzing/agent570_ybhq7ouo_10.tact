contract FlatMixTypes {
    a: Int as int4;
    b: Int as uint32;
    c: Int as coins;
    d: Bool;
    e: Bool?;
    f: String;
    g: String?;
    h: Address;
    i: Address?;
    j: Cell;
    k: Cell?;
    l: Slice;
    m: Slice?;

    init() {
        self.a = 7;
        self.b = 1234;
        self.c = 123456789;
        self.d = true;
        self.e = null;
        self.f = "foo";
        self.g = null;
        self.h = myAddress();
        self.i = null;
        self.j = emptyCell();
        self.k = null;
        self.l = emptyCell().asSlice();
        self.m = null;
    }

    receive() {}
}