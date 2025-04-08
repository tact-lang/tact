contract LargeFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: map<Int, Int>;
    f: Int?;
    g: Bool?;
    h: Address?;
    i: Slice;
    j: Builder;
    k: String;
    l: map<Address, Int>;
    m: map<Address, Bool>;
    n: map<Int, Bool>;
    o: map<Address, Address>;
    p: map<Int, Cell>;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyMap();
        self.f = null;
        self.g = null;
        self.h = null;
        self.i = emptyCell().asSlice();
        self.j = beginCell();
        self.k = "test";
        self.l = emptyMap();
        self.m = emptyMap();
        self.n = emptyMap();
        self.o = emptyMap();
        self.p = emptyMap();
    }
}