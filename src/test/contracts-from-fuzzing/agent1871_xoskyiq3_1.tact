contract TestContract {
    flag: Bool; 
    count: Int; 
    addr: Address;
    data: Cell;
    text: String;

    init() {
        self.flag = true;
        self.count = 123;
        self.addr = myAddress();
        self.data = emptyCell();
        self.text = "hello";
    }
}