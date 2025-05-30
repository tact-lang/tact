contract BigPersistent {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Address;
    h: Address;
    i: String;
    j: Slice;
    k: Cell;
    l: Int;
    m: Int;
    n: Bool;
    o: Address;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = true;
        self.e = false;
        self.f = true;
        self.g = myAddress();
        self.h = myAddress();
        self.i = "hi";
        self.j = emptyCell().asSlice();
        self.k = emptyCell();
        self.l = 4;
        self.m = 5;
        self.n = false;
        self.o = myAddress();
    }

    receive() { }
}