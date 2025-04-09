contract LongPrimitiveChain {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int;
    h: Bool;
    i: String;
    j: Address;
    k: Cell;
    l: Slice;
    m: Int;
    n: Bool;
    o: String;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = self.e.asSlice();
        self.g = 2;
        self.h = true;
        self.i = "hi";
        self.j = self.d;
        self.k = self.e;
        self.l = self.f;
        self.m = 0;
        self.n = false;
        self.o = "end";
    }
}
