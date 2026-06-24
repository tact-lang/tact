contract DefaultTest {
    num: Int = 5;
    flag: Bool = false;
    addr: Address;
    cellVal: Cell;
    sliceVal: Slice;
    strVal: String = "X";

    init() {
        self.addr = myAddress();
        self.cellVal = emptyCell();
        self.sliceVal = self.cellVal.asSlice();
        self.flag = true;
    }
}