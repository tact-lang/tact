contract ManyFields2 {
    i1: Int = 0;
    i2: Int = 0;
    i3: Int = 0;
    i4: Int = 0;
    i5: Int = 0;
    b1: Bool = false;
    b2: Bool = true;
    s1: String = "a";
    s2: String = "b";
    s3: String = "c";
    a1: Address;
    a2: Address?;

    init() {
        self.a1 = myAddress();
        self.a2 = null;
    }
}