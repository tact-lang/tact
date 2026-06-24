contract ManyPrimitiveFields {
    i1: Int = 1;
    i2: Int = 2;
    i3: Int = 3;
    i4: Int = 4;
    
    b1: Bool = false;
    b2: Bool = true;
    b3: Bool = false;
    b4: Bool = true;

    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
    s4: String = "d";

    addr1: Address? = null;
    addr2: Address? = null;

    init() {
        self.i1 = 11;
        self.i2 = 12;
        self.i3 = 13;
        self.i4 = 14;
        self.b1 = true;
        self.b2 = false;
        self.b3 = true;
        self.b4 = false;

        self.s1 = "one";
        self.s2 = "two";
        self.s3 = "three";
        self.s4 = "four";

        self.addr1 = null;
        self.addr2 = null;
    }
}