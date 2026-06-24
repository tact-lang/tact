contract ManyFieldsMix {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: String?;
    f: Address;
    g: Cell;
    h: Slice;
    i: Bool;

    init() {
        self.a = 10;
        self.b = null;
        self.c = "hi";
        self.d = null;
        self.e = null;
        self.f = myAddress();
        self.g = emptyCell();
        self.h = emptyCell().asSlice();
        self.i = false;
    }
}