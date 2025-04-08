contract LongPrimitiveList {
    i1: Int = 1;
    i2: Int = 2;
    i3: Int = 3;
    b1: Bool = true;
    b2: Bool = false;
    s1: String = "1";
    s2: String = "2";
    s3: String = "3";
    a1: Address;
    a2: Address;
    a3: Address;
    
    init() {
        self.a1 = myAddress();
        self.a2 = myAddress();
        self.a3 = myAddress();
    }
}