contract MaxPrimitiveFields {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Builder;
    g: Slice;
    h: Bool;
    i: Int;
    j: Address;

    init() {
        self.a = 1;
        self.b = false;
        self.c = myAddress();
        self.d = "abc";
        self.e = emptyCell();
        self.f = beginCell();
        self.g = emptyCell().asSlice();
        self.h = true;
        self.i = 5;
        self.j = myAddress();
    }
}