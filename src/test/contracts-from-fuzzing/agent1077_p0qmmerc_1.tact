contract TestContract {
    bigInt: Int as int257;
    smallInt: Int as int1;
    boolVal: Bool;
    optInt: Int?;
    stringVal: String;
    sliceVal: Slice;
    cellVal: Cell;

    init() {
        self.bigInt = -1;
        self.smallInt = 1;
        self.boolVal = true;
        self.optInt = 42;
        self.stringVal = "test";
        self.sliceVal = "hello".asSlice();
        self.cellVal = emptyCell();
    }
}