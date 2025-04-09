contract ManyFields {
    a: Int;
    b: Bool;
    c: Cell;
    d: Slice;
    e: Builder;
    f: Address;
    g: String;
    h: Int?;
    i: Bool?;
    j: Cell?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = emptyCell();
        self.d = self.c.asSlice();
        self.e = beginCell();
        self.f = myAddress();
        self.g = "test";
        self.h = null;
        self.i = false;
        self.j = null;
    }
}
