contract ManyFields {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    b1: Bool;
    b2: Bool;
    o1: Int?;
    o2: String?;
    s1: String;
    s2: String;
    c1: Cell;
    c2: Cell;
    a1: Address;
    a2: Address;

    init() {
        self.i1 = 1;
        self.i2 = 2;
        self.i3 = 3;
        self.i4 = 4;
        self.i5 = 5;
        self.b1 = true;
        self.b2 = false;
        self.o1 = null;
        self.o2 = null;
        self.s1 = "hello";
        self.s2 = "world";
        self.c1 = emptyCell();
        self.c2 = emptyCell();
        self.a1 = myAddress();
        self.a2 = myAddress();
    }
}