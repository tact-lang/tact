contract Test {
    first: Int;
    second: Bool;
    third: Address;
    fourth: String;
    fifth: Cell;
    
    init() {
        self.first = 1;
        self.second = true;
        self.third = myAddress();
        self.fourth = "test";
        self.fifth = emptyCell();
    }
}
