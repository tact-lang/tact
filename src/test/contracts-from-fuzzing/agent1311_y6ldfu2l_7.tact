contract ManyPrimitiveFields {
    a: Int;
    b: Bool;
    c: Address;
    d: Cell;
    e: Slice;
    f: String;
    g: Bool;
    h: Int;
    i: Address;
    j: Slice;

    init() {
        self.a = 1;
        self.b = true;
        self.c = myAddress();
        self.d = emptyCell();
        self.e = emptyCell().asSlice();
        self.f = "hi";
        self.g = false;
        self.h = 123;
        self.i = myAddress();
        self.j = emptyCell().asSlice();
    }
}