contract ManyPrimitives {
    a: Int;
    b: Int as uint8;
    c: Int as int64;
    d: Bool;
    e: Bool?;
    f: Int?;
    g: Address;
    h: Address?;
    i: String;
    j: String?;
    k: Slice;
    l: Slice?;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = true;
        self.e = null;
        self.f = null;
        self.g = myAddress();
        self.h = null;
        self.i = "hello";
        self.j = null;
        self.k = emptyCell().asSlice();
        self.l = null;
    }
}