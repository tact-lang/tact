contract ManyFields {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;
    m: Int;
    n: Bool;
    o: String;
    p: Address;
    q: Cell;
    r: Slice;

    init() {
        self.a = 1;
        self.c = false;
        self.e = "x";
        self.g = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.i = emptyCell();
        self.k = emptyCell().asSlice();
        self.m = 42;
        self.n = true;
        self.o = "ok";
        self.p = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.q = emptyCell();
        self.r = emptyCell().asSlice();
    }
}