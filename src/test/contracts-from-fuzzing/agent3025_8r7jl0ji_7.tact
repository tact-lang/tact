contract TestContract {
    a: Int as uint8;
    b: Int as int64;
    c: Int as uint256;
    d: Bool;
    e: Address;
    f: Cell;
    g: Slice;
    h: String;
    i: Bool;
    j: Int;
    k: Int as int8;
    l: Bool;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = true;
        self.e = myAddress();
        self.f = emptyCell();
        self.g = self.f.asSlice();
        self.h = "hi";
        self.i = false;
        self.j = -1;
        self.k = -5;
        self.l = true;
    }
}