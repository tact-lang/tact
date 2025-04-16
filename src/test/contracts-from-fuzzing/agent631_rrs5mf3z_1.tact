contract Test {
    flag: Bool;
    num: Int;
    addr: Address;
    data: Cell;
    text: String;

    init() {
        self.flag = true;
        self.num = 42;
        self.addr = myAddress();
        self.data = emptyCell();
        self.text = "hello";
    }
}
