contract TestContract {
    a: Int;
    b: Int as uint64;
    c: Int?;
    d: Bool;
    e: Bool?;
    f: Address;
    g: String;
    h: Cell;
    i: Slice;
    j: Builder;
    k: Int as int16;
    l: Int as uint8;
    m: String;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = null;
        self.d = true;
        self.e = false;
        self.f = myAddress();
        self.g = "a";
        self.h = emptyCell();
        self.i = emptyCell().asSlice();
        self.j = beginCell();
        self.k = -3;
        self.l = 255;
        self.m = "end";
    }
}
