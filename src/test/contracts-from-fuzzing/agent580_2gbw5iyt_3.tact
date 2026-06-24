contract ManyFields {
    a: Int;
    b: Int as uint32;
    c: Int as int64;
    d: Bool;
    e: Bool;
    f: Bool;
    g: Address;
    h: String;
    i: Cell;
    j: Slice;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = true;
        self.e = false;
        self.f = true;
        self.g = myAddress();
        self.h = "hello";
        self.i = emptyCell();
        self.j = emptyCell().asSlice();
    }
}