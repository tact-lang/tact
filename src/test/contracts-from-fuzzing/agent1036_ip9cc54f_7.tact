contract ManyFieldsDifferentTypes {
    i1: Int;
    i2: Int as uint32;
    bl: Bool;
    addr: Address;
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;
    strVal: String;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optString: String?;

    init() {
        self.i1 = -123;
        self.i2 = 123;
        self.bl = false;
        self.addr = myAddress();
        self.cellVal = emptyCell();
        self.builderVal = beginCell();
        self.sliceVal = emptyCell().asSlice();
        self.strVal = "test";
        self.optInt = null;
        self.optBool = null;
        self.optAddr = null;
        self.optString = null;
    }
}