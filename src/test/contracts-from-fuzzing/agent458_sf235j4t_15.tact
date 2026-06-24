contract Combinations {
    int1: Int = 1;
    bool1: Bool = true;
    str1: String = "test";
    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    addr: Address;
    addrOpt: Address?;

    init() {
        self.intOpt = 42;
        self.boolOpt = null;
        self.strOpt = "x";
        self.addr = myAddress();
        self.addrOpt = null;
    }
}