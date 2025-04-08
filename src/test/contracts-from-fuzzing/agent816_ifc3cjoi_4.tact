contract LargeMultiField {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Bool?;
    h: Int?;
    i: Slice;
    j: String;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "abc";
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = myAddress();
        self.g = null;
        self.h = 42;
        self.i = emptyCell().asSlice();
        self.j = "xyz";
    }
}