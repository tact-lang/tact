struct Inner {
    a: Int;
    b: Bool;
}

contract TestContract {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Slice;
    field5: Cell;
    field6: Address;
    field7: Inner;
    
    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = "hello";
        self.field4 = emptyCell().asSlice();
        self.field5 = emptyCell();
        self.field6 = myAddress();
        self.field7 = Inner{ a: 10, b: false };
    }
}