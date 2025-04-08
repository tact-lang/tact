contract Test {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
    e: Cell;
    f: Slice;
    g: String;
    h: Address;
    i: String?;
    j: Address?;
    init() {
        self.a = 1;
        self.b = true;
        self.c = null;
        self.d = false;
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = "str";
        self.h = myAddress();
        self.i = null;
        self.j = null;
    }
}