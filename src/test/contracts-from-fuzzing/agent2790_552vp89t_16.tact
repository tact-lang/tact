contract MixedPersistent {
    num: Int;
    flag: Bool;
    text: String;
    sliceVal: Slice;
    cellVal: Cell;
    addrVal: Address;
    optNum: Int?;
    optFlag: Bool?;
    optStr: String?;
    optSlice: Slice?;
    optCell: Cell?;
    optAddr: Address?;

    init() {
        self.num = 1;
        self.flag = true;
        self.text = "abc";
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.addrVal = myAddress();
        self.optNum = null;
        self.optFlag = null;
        self.optStr = null;
        self.optSlice = null;
        self.optCell = null;
        self.optAddr = null;
    }
}