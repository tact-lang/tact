contract ManyFields {
    a: Int;
    b: Int as uint8;
    c: Bool;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Address;
    i: Int?;
    j: String?;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = true;
        self.d = "hi";
        self.e = emptyCell();
        self.f = emptyCell().asSlice();
        self.g = beginCell();
        self.h = myAddress();
        self.i = null;
        self.j = null;
    }
}