contract ManyTypes {
    number: Int;
    flag: Bool;
    text: String;
    addr: Address;
    slice: Slice;
    cell: Cell;
    builder: Builder;
    optionalInt: Int?;
    optionalAddr: Address?;
    optionalCell: Cell?;

    init() {
        self.number = 123;
        self.flag = true;
        self.text = "hi";
        self.addr = myAddress();
        self.slice = emptyCell().asSlice();
        self.cell = emptyCell();
        self.builder = beginCell();
        self.optionalInt = null;
        self.optionalAddr = null;
        self.optionalCell = null;
    }
}