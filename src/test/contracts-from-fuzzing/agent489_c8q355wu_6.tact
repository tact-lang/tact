contract DiverseTypes {
    n: Int;
    flag: Bool;
    txt: String;
    addr: Address;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;

    init() {
        self.n = 42;
        self.flag = true;
        self.txt = "hello";
        self.addr = myAddress();
        self.optInt = null;
        self.optBool = null;
        self.optStr = null;
        self.optAddr = null;
        self.cellVal = emptyCell();
        self.sliceVal = emptyCell().asSlice();
        self.builderVal = beginCell();
    }
}