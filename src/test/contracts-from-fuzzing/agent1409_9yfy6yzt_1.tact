contract TestContract {
    flag: Bool;
    number: Int;
    addressField: Address;
    text: String;
    dataCell: Cell;
    
    init() {
        self.flag = true;
        self.number = 123;
        self.addressField = myAddress();
        self.text = "hello";
        self.dataCell = emptyCell();
    }
}