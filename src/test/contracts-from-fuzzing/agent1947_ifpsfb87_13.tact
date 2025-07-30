contract ManyFields {
    i1: Int;
    i2: Int;
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
        self.b1 = true;
        self.b2 = false;
        self.s1 = "abc";
        self.s2 = "def";
        self.c1 = emptyCell();
        self.c2 = emptyCell();
        self.a1 = myAddress();
        self.a2 = myAddress();
    }
}