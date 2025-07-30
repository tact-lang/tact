contract VariedFields {
    i1: Int;
    i2: Int as uint8;
    b1: Bool;
    s1: String;
    c1: Cell;
    a1: Address;
    o1: Int?;
    o2: Bool?;
    o3: Address?;
    i3: Int as int32;

    init() {
        self.i1 = 10;
        self.i2 = 255;
        self.b1 = true;
        self.s1 = "hi";
        self.c1 = emptyCell();
        self.a1 = myAddress();
        self.o1 = 123;
        self.o2 = false;
        self.o3 = null;
        self.i3 = -32;
    }
}