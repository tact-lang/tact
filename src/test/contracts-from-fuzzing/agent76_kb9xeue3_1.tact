struct Nested {
    a: Int;
    b: Bool;
}

contract Test {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Cell;
    field5: Slice;
    field6: Address;
    nestedField: Nested;

    init() {
        self.field1 = 42;
        self.field2 = true;
        self.field3 = "test";
        self.field4 = emptyCell();
        self.field5 = emptyCell().asSlice();
        self.field6 = myAddress();
        self.nestedField = Nested{ a: 5, b: false };
    }
}
