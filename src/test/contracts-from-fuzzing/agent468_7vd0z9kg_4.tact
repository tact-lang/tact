// Test contract with many fields of diverse primitive types and optionals
contract ManyFields {
    i1: Int;
    i2: Int?;
    i3: Int;
    b1: Bool;
    b2: Bool?;
    s1: String;
    s2: String?;
    addr1: Address;
    addr2: Address?;
    c1: Cell;
    c2: Cell?;

    init() {
        self.i1 = 1;
        self.i2 = null;
        self.i3 = 3;
        self.b1 = true;
        self.b2 = null;
        self.s1 = "foo";
        self.s2 = null;
        self.addr1 = myAddress();
        self.addr2 = null;
        self.c1 = emptyCell();
        self.c2 = null;
    }
}