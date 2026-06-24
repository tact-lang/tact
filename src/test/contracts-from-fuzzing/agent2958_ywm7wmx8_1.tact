contract Test {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: Builder;
    g: String;
    h: Int?;
    i: Bool?;
    j: Address?;
    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = beginCell();
        self.g = "hello";
        self.h = null;
        self.i = null;
        self.j = null;
    }
}