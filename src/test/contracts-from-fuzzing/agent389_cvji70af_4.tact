contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Builder;
    f: Cell;
    g: Address;
    h: Int?;
    i: Bool?;
    j: Cell?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = "s";
        self.d = emptyCell().asSlice();
        self.e = beginCell();
        self.f = emptyCell();
        self.g = myAddress();
        self.h = null;
        self.i = null;
        self.j = null;
    }
}