contract TestContract {
    flag: Bool;
    counter: Int as uint32;
    amount: Int as coins;
    addr: Address;
    dataCell: Cell;
    codeSlice: Slice;
    text: String;

    init() {
        self.flag = true;
        self.counter = 255;
        self.amount = ton("1");
        self.addr = myAddress();
        self.dataCell = emptyCell();
        self.codeSlice = emptyCell().asSlice();
        self.text = "Hello";
    }
}