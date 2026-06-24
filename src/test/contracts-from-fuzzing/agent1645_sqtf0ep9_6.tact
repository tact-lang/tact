contract MultipleFieldsVariedTypes {
    num: Int;
    flag: Bool;
    addr: Address;
    cellField: Cell;
    text: String;

    init() {
        self.num = 10;
        self.flag = true;
        self.addr = myAddress();
        self.cellField = emptyCell();
        self.text = "hello";
    }
}