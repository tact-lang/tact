contract Test {
    flag: Bool;
    count: Int;
    text: String;
    data: Cell;
    addr: Address;

    init() {
        self.flag = true;
        self.count = 123;
        self.text = "abc";
        self.data = emptyCell();
        self.addr = myAddress();
    }
}