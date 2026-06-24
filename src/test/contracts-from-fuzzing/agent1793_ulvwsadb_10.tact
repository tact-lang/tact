contract ManyTypes {
    amount: Int as uint64;
    flag: Bool;
    label: String;
    data: Cell;
    codeRef: Cell;
    sliceVal: Slice;
    addr: Address;

    init() {
        self.amount = 1;
        self.flag = true;
        self.label = "x";
        self.data = emptyCell();
        self.codeRef = emptyCell();
        self.sliceVal = self.data.asSlice();
        self.addr = myAddress();
    }
}