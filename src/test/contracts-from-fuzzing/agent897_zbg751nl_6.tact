contract Test {
    number: Int as uint64 = 1;
    smallNum: Int as uint4 = 3;
    bigNum: Int as int256 = -1;
    tinyNum: Int as int1 = 0;

    init() {
        self.number = 42;
        self.smallNum = 5;
        self.bigNum = -123456789;
        self.tinyNum = 1;
    }
}
