struct NestedStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Slice;
    e: Cell;
    g: Address;
    h: Int?;
    i: Bool?;
}

contract TestStorage {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Slice;
    field5: Cell;
    field6: Address;
    field7: Int?;
    field8: Bool?;
    nested: NestedStruct;

    init() {
        self.field1 = 1;
        self.field2 = true;
        self.field3 = "hello";
        self.field4 = emptyCell().asSlice();
        self.field5 = emptyCell();
        self.field6 = myAddress();
        self.field7 = null;
        self.field8 = null;
        self.nested = NestedStruct{
            a: 2,
            b: false,
            c: "world",
            d: emptyCell().asSlice(),
            e: emptyCell(),
            g: myAddress(),
            h: null,
            i: null,
        };
    }
}
