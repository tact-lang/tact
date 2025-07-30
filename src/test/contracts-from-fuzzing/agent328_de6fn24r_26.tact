contract MultiLayered {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Cell;
    f: Slice;
    g: String;
    h: Address;
    i: Int;
    j: Bool;
    init() {
        self.a = 10;
        self.b = false;
        self.c = null;
        self.d = null;
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = "test";
        self.h = myAddress();
        self.i = 42;
        self.j = true;
    }
}