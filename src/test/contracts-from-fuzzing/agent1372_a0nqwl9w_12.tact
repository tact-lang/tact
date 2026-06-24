contract ManyFieldsSizes {
    smallInt: Int as uint4;
    midInt: Int as uint64;
    bigInt: Int as uint256;
    normalInt: Int;
    flag: Bool;
    hash: Cell;
    str: String;

    init() {
        self.smallInt = 7;
        self.midInt = 12345678;
        self.bigInt = 12345678901234567890;
        self.normalInt = -1;
        self.flag = true;
        self.hash = emptyCell();
        self.str = "text";
    }
}