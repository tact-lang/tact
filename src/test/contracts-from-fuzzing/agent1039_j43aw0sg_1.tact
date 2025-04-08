contract TestContract {
    data: Int;
    flag: Bool;
    text: String;
    someSlice: Slice;
    someCell: Cell;
    addr: Address;

    init() {
        self.data = 1;
        self.flag = true;
        self.text = "hello";
        self.someSlice = emptyCell().asSlice();
        self.someCell = emptyCell();
        self.addr = myAddress();
    }
}