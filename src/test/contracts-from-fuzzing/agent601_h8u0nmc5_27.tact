// Large flat contract persistent state with diverse types
contract LargeStore {
    i: Int;
    flag: Bool;
    txt: String;
    addr: Address;
    maybeInt: Int?;
    maybeBool: Bool?;
    bigInt: Int as uint256;
    coinInt: Int as coins;
    smallInt: Int as uint8;

    init() {
        self.i = 1;
        self.flag = false;
        self.txt = "abc";
        self.addr = myAddress();
        self.maybeInt = null;
        self.maybeBool = null;
        self.bigInt = 1000000;
        self.coinInt = 12345;
        self.smallInt = 255;
    }
}
