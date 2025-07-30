struct Nested {
    n1: Int;
    n2: Int?;
}

contract TestContract {
    field1: Int;
    field2: Bool;
    field3: Address;
    field4: Slice;
    field5: Cell;
    field6: String;
    nested: Nested;
    optionalNested: Nested?;
    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = myAddress();
        self.field4 = emptyCell().asSlice();
        self.field5 = emptyCell();
        self.field6 = "test";
        self.nested = Nested{n1: 42, n2: null};
        self.optionalNested = null;
    }
}