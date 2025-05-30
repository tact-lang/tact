contract ManyPrimitives {
    a: Int;
    b: Int as uint4;
    c: Int?;
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
        self.a = 1;
        self.b = 5;
        self.c = null;
        self.d = true;
        self.e = false;
        self.f = "foo";
        self.g = "bar";
        self.h = myAddress();
        self.i = null;
        self.j = emptyCell();
        self.k = null;
        self.l = emptyCell().asSlice();
        self.m = null;
    }

    receive() {
        self.a += 1;
    }
}