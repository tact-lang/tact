contract ChainedFields {
    int1: Int;
    int2: Int;
    int3: Int;
    int4: Int;

    bool1: Bool;
    bool2: Bool;

    addr1: Address;
    addr2: Address;

    optInt: Int?;
    optBool: Bool?;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.int3 = 3;
        self.int4 = 4;

        self.bool1 = true;
        self.bool2 = false;

        self.addr1 = myAddress();
        self.addr2 = myAddress();

        self.optInt = null;
        self.optBool = null;
    }
}