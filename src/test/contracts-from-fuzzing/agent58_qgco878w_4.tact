contract ManyPrims {
    a: Int;
    b: Int as uint8;
    c: Int as uint256;
    d: Bool;
    e: Address;
    f: Cell;
    g: Slice;
    h: String;
    i: Int as int16;
    j: Bool;

    init() {
        self.a = 1;
        self.b = 2;
        self.c = 3;
        self.d = true;
        self.e = myAddress();
        self.f = emptyCell();
        self.g = emptyCell().asSlice();
        self.h = "hello";
        self.i = -123;
        self.j = false;
    }
}