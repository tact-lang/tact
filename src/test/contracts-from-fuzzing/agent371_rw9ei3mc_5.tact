contract ManyPrimitiveFields {
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;
    int5: Int;
    bool1: Bool;
    bool2: Bool;
    bool3: Bool;
    bool4: Bool;
    bool5: Bool;
    str1: String;
    str2: String;
    str3: String;
    str4: String;
    str5: String;
    address1: Address;
    address2: Address;
    address3: Address;
    address4: Address;
    address5: Address;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.int3 = 3;
        self.int4 = 4;
        self.int5 = 5;
        self.bool1 = true;
        self.bool2 = false;
        self.bool3 = true;
        self.bool4 = false;
        self.bool5 = true;
        self.str1 = "a";
        self.str2 = "b";
        self.str3 = "c";
        self.str4 = "d";
        self.str5 = "e";
        self.address1 = myAddress();
        self.address2 = myAddress();
        self.address3 = myAddress();
        self.address4 = myAddress();
        self.address5 = myAddress();
    }
}