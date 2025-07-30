struct Deep {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Bool?;
    h: Int?;
}

contract ManyPersistentFields {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Cell;
    field5: Slice;
    field6: Address;
    field7: Bool?;
    field8: Int?;
    complex: Deep;

    init() {
        self.field1 = 0;
        self.field2 = true;
        self.field3 = "hello";
        self.field4 = emptyCell();
        self.field5 = emptyCell().asSlice();
        self.field6 = myAddress();
        self.field7 = false;
        self.field8 = null;
        self.complex = Deep{
            a: 1,
            b: false,
            c: "world",
            d: emptyCell(),
            e: emptyCell().asSlice(),
            f: myAddress(),
            g: null,
            h: 2
        };
    }
}
