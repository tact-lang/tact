contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Cell;
    i: Builder;
    j: Slice;
    k: Int = 1;
    l: Bool = false;
    m: String = "hi";
    n: Int?;
    o: Bool?;
    p: String?;

    init() {
        self.d = null;
        self.e = null;
        self.f = null;
        self.n = null;
        self.o = null;
        self.p = null;
        self.a = 42;
        self.b = true;
        self.c = "abc";
        self.g = myAddress();
        self.h = emptyCell();
        self.i = beginCell();
        self.j = emptyCell().asSlice();
    }
}