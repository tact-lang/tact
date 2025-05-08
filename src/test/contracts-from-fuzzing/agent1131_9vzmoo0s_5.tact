contract ManyFields {
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    int5: Int;
    bool1: Bool;
    bool2: Bool;
    address1: Address;
    address2: Address;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.int3 = 3;
        self.int4 = 4;
        self.int5 = 5;
        self.bool1 = true;
        self.bool2 = false;
        self.address1 = myAddress();
        self.address2 = myAddress();
    }
}