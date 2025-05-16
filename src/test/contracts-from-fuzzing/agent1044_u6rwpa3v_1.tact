struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
}

contract TestContract {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Cell;
    field5: Slice;
    field6: Address;
    field7: NestedStruct;
    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = "test";
        self.field4 = emptyCell();
        self.field5 = emptyCell().asSlice();
        self.field6 = myAddress();
        self.field7 = NestedStruct {
            a: 10,
            b: false,
            c: "inner",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress()
        };
    }
}