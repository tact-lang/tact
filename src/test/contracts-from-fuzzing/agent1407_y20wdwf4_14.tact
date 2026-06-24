contract TestContract {
    a: Int;
    b: Int as uint32;
    c: Bool;
    d: Address;
    e: Cell;
    f: Slice;
    g: String;
    h: Bool?;
    i: Int?;
    j: Address?;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = myAddress();
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = "test";
        self.h = null;
        self.i = null;
        self.j = null;
    }
}