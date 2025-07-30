contract TestContract {
    a: Int;
    b: Int;
    c: Int;
    d: Bool;
    e: Bool = false;
    f: String;
    g: String?;
    h: Cell;
    i: Slice;
    j: Address;
    k: Int;
    l: Int;
    m: Bool;
    n: String;
    o: String? = null;
    p: Cell;
    q: Slice;
    r: Address;
    s: Int = 123;
    t: Bool = true;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = true;
        self.f = "hi";
        self.g = "opt";
        self.h = emptyCell();
        self.i = emptyCell().asSlice();
        self.j = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.k = 4;
        self.l = 5;
        self.m = false;
        self.n = "x";
        self.o = "opt2";
        self.p = emptyCell();
        self.q = emptyCell().asSlice();
        self.r = address("EQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAM9c");
        self.s = 456;
        self.t = false;
    }

    receive() {
        let _ = self.a;
    }
}