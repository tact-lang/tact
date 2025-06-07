contract ChainContract {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Int as uint32;
    f: Int as uint64;
    g: Int as int8;
    h: String;
    i: Cell;
    j: Slice;
    k: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = null;
        self.e = 10;
        self.f = 20;
        self.g = -5;
        self.h = "test";
        self.i = emptyCell();
        self.j = emptyCell().asSlice();
        self.k = myAddress();
    }
}