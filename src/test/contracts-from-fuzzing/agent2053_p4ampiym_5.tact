contract ManyPrimitiveFields {
    int1: Int;
    int2: Int;
    int3: Int;
    bool1: Bool;
    bool2: Bool;
    addr1: Address;
    str1: String;
    str2: String;

    init() {
        self.int1 = 1;
        self.int2 = -2;
        self.int3 = 3;
        self.bool1 = false;
        self.bool2 = true;
        self.addr1 = myAddress();
        self.str1 = "x";
        self.str2 = "y";
    }
}