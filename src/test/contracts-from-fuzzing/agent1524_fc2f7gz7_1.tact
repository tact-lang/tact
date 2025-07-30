struct Nested {
    field1: Int;
    field2: Bool;
}

contract Test {
    val1: Int;
    val2: Bool;
    val3: String;
    val4: Cell;
    val5: Address;
    val6: Slice;
    val7: Nested;
    
    init() {
        self.val1 = 1;
        self.val2 = true;
        self.val3 = "test";
        self.val4 = emptyCell();
        self.val5 = myAddress();
        self.val6 = self.val4.asSlice();
        self.val7 = Nested{ field1: 10, field2: false };
    }
}