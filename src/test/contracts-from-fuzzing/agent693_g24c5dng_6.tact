struct Mini { a: Int; b: Bool; }

contract ManyVars {
    a: Int;
    b: Int as uint32;
    c: Bool;
    d: String;
    e: Int?;
    f: String?;
    g: Bool?;
    h: Address;
    i: Cell;
    j: Slice;
    k: Mini;
    l: Mini?;
    m: Int as int8;
    n: Int? as int16;
    o: Bool;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = "s";
        self.e = null;
        self.f = null;
        self.g = null;
        self.h = myAddress();
        self.i = emptyCell();
        self.j = emptyCell().asSlice();
        self.k = Mini{a:3,b:false};
        self.l = null;
        self.m = 7;
        self.n = null;
        self.o = false;
    }
}