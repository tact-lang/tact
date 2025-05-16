contract ManyPrimitives {
    a: Int;
    b: Bool;
    c: Address;
    d: String;
    e: Cell;
    f: Slice;
    g: Builder;
    h: Int?;
    i: Bool?;
    j: String?;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = "foo";
        self.e = emptyCell();
        self.f = self.e.asSlice();
        self.g = beginCell();
        self.h = null;
        self.i = false;
        self.j = null;
    }
}