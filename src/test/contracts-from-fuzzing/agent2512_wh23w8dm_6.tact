contract MultiplePrimitiveTypes {
    n: Int;
    flag: Bool;
    text: String;
    addr: Address;
    dataCell: Cell;
    builder: Builder;
    slice: Slice;

    init() {
        self.n = 1;
        self.flag = true;
        self.text = "ok";
        self.addr = myAddress();
        self.dataCell = emptyCell();
        self.builder = beginCell();
        self.slice = emptyCell().asSlice();
    }
}