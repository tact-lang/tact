contract MixedFields {
    count: Int;
    flag: Bool;
    note: String;
    addr: Address;
    cellData: Cell;
    sliceData: Slice;

    init() {
        self.count = 123;
        self.flag = false;
        self.note = "note";
        self.addr = myAddress();
        self.cellData = emptyCell();
        self.sliceData = emptyCell().asSlice();
    }
}