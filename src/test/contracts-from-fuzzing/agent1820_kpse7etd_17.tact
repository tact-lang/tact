contract MixedOptionals {
    a: Int?;
    b: Bool;
    c: Bool?;
    d: Address;
    e: Address?;
    f: Cell;
    g: Cell?;
    h: Slice;
    i: Slice?;
    init() {
        self.a = null;
        self.b = true;
        self.c = null;
        self.d = myAddress();
        self.e = null;
        self.f = emptyCell();
        self.g = null;
        self.h = emptyCell().asSlice();
        self.i = null;
    }
}