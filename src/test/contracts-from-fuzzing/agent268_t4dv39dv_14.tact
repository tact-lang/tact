// Large contract with many mixed persistent fields
contract LargeContract {
    int1: Int;
    int2: Int?;
    bool1: Bool;
    bool2: Bool?;
    str1: String;
    str2: String;
    addr1: Address;
    addr2: Address?;

    init() {
        self.int1 = 10;
        self.int2 = null;
        self.bool1 = true;
        self.bool2 = false;
        self.str1 = "alpha";
        self.str2 = "beta";
        self.addr1 = myAddress();
        self.addr2 = null;
    }
}