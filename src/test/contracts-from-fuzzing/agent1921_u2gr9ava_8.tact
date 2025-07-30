contract ExplicitInit {
    flag: Bool;
    counter: Int;
    addr: Address;
    text: String;
    data: Cell;

    init() {
        self.flag = true;
        self.counter = 42;
        self.addr = myAddress();
        self.text = "hello";
        self.data = emptyCell();
    }
}