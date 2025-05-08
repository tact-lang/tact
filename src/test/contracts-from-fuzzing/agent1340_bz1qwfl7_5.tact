contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Cell;
    h: Slice;
    i: Builder;
    j: Address;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "abc";
        self.d = null;
        self.e = null;
        self.f = null;
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = beginCell();
        self.j = myAddress();
    }
}