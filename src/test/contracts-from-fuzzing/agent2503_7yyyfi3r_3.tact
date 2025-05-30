contract Test {
    bigInt: Int as int257;
    smallInt: Int as int8;
    mediumUInt: Int as uint128;
    tinyUInt: Int as uint4;
    flag: Bool;
    text: String;
    someSlice: Slice;
    someBuilder: Builder;
    addr: Address;
    maybeInt: Int?;
    maybeStr: String?;
    maybeAddress: Address?;

    init() {
        self.bigInt = 0;
        self.smallInt = 0;
        self.mediumUInt = 0;
        self.tinyUInt = 0;
        self.flag = false;
        self.text = "";
        self.someSlice = emptyCell().asSlice();
        self.someBuilder = beginCell();
        self.addr = myAddress();
        self.maybeInt = null;
        self.maybeStr = null;
        self.maybeAddress = null;
    }
}
