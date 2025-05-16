contract SerialOrder {
    flag: Bool;
    number: Int as uint16;
    text: String;
    addr: Address;
    blob: Cell;

    init() {
        self.flag = true;
        self.number = 555;
        self.text = "hello";
        self.addr = myAddress();
        self.blob = emptyCell();
    }
}