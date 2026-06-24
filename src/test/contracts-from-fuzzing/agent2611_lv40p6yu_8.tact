contract ManyPrimitives {
    i1: Int;
    i2: Int as uint8;
    i3: Int as int16;
    b1: Bool;
    s1: String;
    a1: Address;
    c1: Cell;
    sl1: Slice;

    init() {
        self.i1 = 1;
        self.i2 = 255;
        self.i3 = -1234;
        self.b1 = true;
        self.s1 = "abc";
        self.a1 = myAddress();
        self.c1 = emptyCell();
        self.sl1 = emptyCell().asSlice();
    }
}