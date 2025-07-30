// test contract with lots of diverse primitive persistent fields
contract Test {
    i1: Int;
    i2: Int?;
    b1: Bool;
    b2: Bool?;
    a1: Address;
    a2: Address?;
    s1: String;
    s2: String?;

    init() {
        self.i1 = 1;
        self.i2 = null;
        self.b1 = true;
        self.b2 = null;
        self.a1 = myAddress();
        self.a2 = null;
        self.s1 = "abc";
        self.s2 = null;
    }
}