contract ContractWithManyPrimitives {
    i1: Int;
    b1: Bool;
    s1: String;
    a1: Address;
    c1: Cell;

    i2: Int?;
    b2: Bool?;
    s2: String?;
    a2: Address?;

    init() {
        self.i1 = 1;
        self.b1 = true;
        self.s1 = "hello";
        self.a1 = myAddress();
        self.c1 = emptyCell();

        self.i2 = null;
        self.b2 = null;
        self.s2 = null;
        self.a2 = null;
    }
}