struct Coord {
    x: Int;
    y: Int;
}

contract ManyFields {
    a: Int;
    b: Int;
    c: Int;
    d: Int;
    e: Int;
    f: Bool;
    g: Bool;
    h: Bool;
    i: String;
    j: String;
    k: Address;
    l: Address;
    m: Coord;
    n: Coord;
    o: Slice;
    p: Cell;
    q: Cell;
    r: String;
    s: Bool;
    t: Int;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = 4;
        self.e = 5;
        self.f = true;
        self.g = false;
        self.h = true;
        self.i = "i";
        self.j = "j";
        self.k = myAddress();
        self.l = myAddress();
        self.m = Coord{ x: 10, y: 20 };
        self.n = Coord{ x: 30, y: 40 };
        self.o = emptyCell().asSlice();
        self.p = emptyCell();
        self.q = emptyCell();
        self.r = "r";
        self.s = false;
        self.t = -1;
    }
}