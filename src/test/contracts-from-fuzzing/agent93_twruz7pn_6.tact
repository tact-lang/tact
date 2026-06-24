contract ManyPrimitives {
    a1: Int;
    a2: Int;
    a3: Int;
    a4: Int;
    a5: Bool;
    a6: Bool;
    a7: Bool;
    a8: Bool;
    s1: String;
    s2: String;
    s3: String;
    s4: String;
    addr1: Address;
    addr2: Address;
    addr3: Address;
    addr4: Address;

    init() {
        self.a1 = 1;
        self.a2 = 2;
        self.a3 = 3;
        self.a4 = 4;
        self.a5 = true;
        self.a6 = false;
        self.a7 = true;
        self.a8 = false;
        self.s1 = "x";
        self.s2 = "y";
        self.s3 = "z";
        self.s4 = "w";
        self.addr1 = myAddress();
        self.addr2 = myAddress();
        self.addr3 = myAddress();
        self.addr4 = myAddress();
    }
}