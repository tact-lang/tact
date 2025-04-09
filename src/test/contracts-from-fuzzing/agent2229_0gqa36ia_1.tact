contract TestContract {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Cell;
    field5: Address;
    
    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = "test";
        self.field4 = emptyCell();
        self.field5 = myAddress();
    }
}
