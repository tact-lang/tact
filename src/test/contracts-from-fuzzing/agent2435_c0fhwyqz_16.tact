contract MixedFields {
    i: Int;
    b: Bool;
    s: String;
    sl: Slice;
    c: Cell;
    o: Int?;
    ob: Bool?;
    os: String?;
    osl: Slice?;
    oc: Cell?;

    init() {
        self.i = 123;
        self.b = false;
        self.s = "hi";
        self.sl = emptyCell().asSlice();
        self.c = emptyCell();
        self.o = null;
        self.ob = null;
        self.os = null;
        self.osl = null;
        self.oc = null;
    }
}