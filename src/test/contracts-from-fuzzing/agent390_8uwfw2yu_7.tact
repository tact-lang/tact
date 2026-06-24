contract ManyFields {
    i1: Int;
    i2: Int;
    i3: Int;
    i4: Int;
    b1: Bool;
    b2: Bool;
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
        self.b1 = true;
        self.b2 = false;
        self.s1 = "one";
        self.s2 = "two";
        self.c1 = emptyCell();
        self.c2 = emptyCell();
        self.a1 = myAddress();
        self.a2 = myAddress();
    }
}
