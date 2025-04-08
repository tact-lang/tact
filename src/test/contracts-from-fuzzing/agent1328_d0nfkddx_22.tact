contract OrderFields {
    flag: Bool;
    num: Int;
    text: String;
    addr: Address;
    sliceVal: Slice;
    cellVal: Cell;
    optFlag: Bool?;
    optNum: Int?;
    optStr: String?;
    optAddr: Address?;

    init() {
        self.flag = true;
        self.num = 123;
        self.text = "text";
        self.addr = myAddress();
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.optFlag = null;
        self.optNum = null;
        self.optStr = null;
        self.optAddr = null;
    }
}