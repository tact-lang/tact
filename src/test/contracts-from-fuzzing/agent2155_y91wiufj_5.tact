contract ManyFields {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    i5: Int;
    i6: Int;
    i7: Int;
    i8: Int;
    i9: Int;
    i10: Int;
    b1: Bool;
    b2: Bool;
    b3: Bool;
    b4: Bool;
    b5: Bool;
    s1: String;
    s2: String;
    a1: Address;
    a2: Address;
    c1: Cell;
    
    init() {
        self.i1 = 1;
        self.i2 = 2;
        self.i3 = 3;
        self.i4 = 4;
        self.i5 = 5;
        self.i6 = 6;
        self.i7 = 7;
        self.i8 = 8;
        self.i9 = 9;
        self.i10 = 10;
        self.b1 = true;
        self.b2 = false;
        self.b3 = true;
        self.b4 = false;
        self.b5 = true;
        self.s1 = "abc";
        self.s2 = "def";
        self.a1 = myAddress();
        self.a2 = myAddress();
        self.c1 = emptyCell();
    }
}