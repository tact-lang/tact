contract ManyPrimitives {
    i1: Int;
    i2: Int;
    b1: Bool;
    b2: Bool;
    s1: String;
    s2: String;
    a1: Address;
    a2: Address;

    init() {
        self.i1 = 1;
        self.i2 = 2;
        self.b1 = true;
        self.b2 = false;
        self.s1 = "s1";
        self.s2 = "s2";
        self.a1 = myAddress();
        self.a2 = myAddress();
    }
}