contract ManyFields {
    int1: Int;
    int2: Int as int64;
    int3: Int as uint8;
    flag1: Bool;
    flag2: Bool;
    txt: String;
    optInt: Int?;
    optBool: Bool?;
    addr: Address;
    cellData: Cell;
    builderData: Builder;
    sliceData: Slice;
    strOpt: String?;
    addrOpt: Address?;
    cellOpt: Cell?;
    builderOpt: Builder?;
    sliceOpt: Slice?;

    init() {
        self.int1 = 1;
        self.int2 = 2;
        self.int3 = 3;
        self.flag1 = true;
        self.flag2 = false;
        self.txt = "hello";
        self.optInt = null;
        self.optBool = null;
        self.addr = myAddress();
        self.cellData = emptyCell();
        self.builderData = beginCell();
        self.sliceData = emptyCell().asSlice();
        self.strOpt = null;
        self.addrOpt = null;
        self.cellOpt = null;
        self.builderOpt = null;
        self.sliceOpt = null;
    }
}