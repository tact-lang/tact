contract LongFields {
    i1: Int;
    b1: Bool;
    s1: String;
    c1: Cell;
    a1: Address;

    i2: Int as int64;
    b2: Bool;
    s2: String;
    c2: Cell;
    a2: Address;

    i3: Int as uint32;
    b3: Bool;
    s3: String;
    c3: Cell;
    a3: Address;

    init() {
        self.i1 = 1;
        self.b1 = true;
        self.s1 = "s1";
        self.c1 = emptyCell();
        self.a1 = myAddress();

        self.i2 = 2;
        self.b2 = false;
        self.s2 = "s2";
        self.c2 = emptyCell();
        self.a2 = myAddress();

        self.i3 = 3;
        self.b3 = true;
        self.s3 = "s3";
        self.c3 = emptyCell();
        self.a3 = myAddress();
    }
}