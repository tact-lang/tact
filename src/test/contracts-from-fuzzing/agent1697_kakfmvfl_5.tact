contract LongFields {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Address;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String;
    j: Cell;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "a";
        self.d = emptyCell();
        self.e = myAddress();
        self.f = emptyCell().asSlice();
        self.g = null;
        self.h = false;
        self.i = "b";
        self.j = emptyCell();
    }
}