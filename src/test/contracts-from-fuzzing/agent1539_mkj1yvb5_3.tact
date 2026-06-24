contract ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Bool?;
    i: String?;
    j: Int?;

    init() {
        self.a = 1;
        self.b = false;
        self.c = "abc";
        self.d = myAddress();
        self.e = emptyCell();
        self.f = self.e.asSlice();
        self.g = beginCell();
        self.h = null;
        self.i = null;
        self.j = null;
    }
}