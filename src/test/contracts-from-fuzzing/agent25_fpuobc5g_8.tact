contract Test {
    i1: Int as uint8;
    i2: Int as int64;
    i3: Int as uint16;
    i4: Int as int128;
    b1: Bool;
    s1: String;
    a1: Address;
    c1: Cell;
    i5: Int;
    init() {
        self.i1 = 1;
        self.i2 = -2;
        self.i3 = 3;
        self.i4 = -4;
        self.b1 = true;
        self.s1 = "abc";
        self.a1 = myAddress();
        self.c1 = emptyCell();
        self.i5 = 12345;
    }
}