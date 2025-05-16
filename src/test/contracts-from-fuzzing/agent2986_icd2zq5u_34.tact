// generic many optional primitive fields
contract ManyOptPrims {
    i1: Int?;
    i2: Int?;
    b1: Bool?;
    b2: Bool?;
    s1: String?;
    s2: String?;
    a1: Address?;
    a2: Address?;

    init() {
        self.i1 = null; self.i2 = null;
        self.b1 = null; self.b2 = null;
        self.s1 = null; self.s2 = null;
        self.a1 = null; self.a2 = null;
    }
}