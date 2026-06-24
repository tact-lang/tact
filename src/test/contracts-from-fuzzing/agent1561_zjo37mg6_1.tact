struct Nested {
    a: Int;
    b: Bool?;
    c: String;
}

contract TestContract {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Cell;
    field5: Builder;
    field6: Slice;
    field7: Address;
    field8: String;
    field9: Bool?;
    field10: Nested;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = "abc";
        self.field4 = emptyCell();
        self.field5 = beginCell();
        self.field6 = emptyCell().asSlice();
        self.field7 = myAddress();
        self.field8 = "xyz";
        self.field9 = null;
        self.field10 = Nested{
            a: 10,
            b: null,
            c: "nested"
        };
    }
}
