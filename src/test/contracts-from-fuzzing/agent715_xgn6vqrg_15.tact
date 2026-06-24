contract TestContract {
    number: Int = 123;
    flag: Bool = true;
    addr: Address;
    txt: String = "Hello";
    sliceVal: Slice;
    cellVal: Cell;

    init() {
        self.addr = myAddress();
        self.sliceVal = emptyCell().asSlice();
        self.cellVal = emptyCell();
        self.number = 456;
        self.flag = false;
        self.txt = "World";
    }
}