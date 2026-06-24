contract Test {
    flag: Bool;
    bigNum: Int as uint256;
    smallNum: Int as int8;
    optVal: Int?;
    addr: Address;
    slice: Slice;
    cellVar: Cell;
    someMap: map<Int, Address>;

    init() {
        self.flag = true;
        self.bigNum = 255;
        self.smallNum = 5;
        self.optVal = null;
        self.addr = myAddress();
        self.slice = emptyCell().asSlice();
        self.cellVar = emptyCell();
        self.someMap = emptyMap();
    }
}