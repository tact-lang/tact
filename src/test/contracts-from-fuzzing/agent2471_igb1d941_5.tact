struct LongStruct {
    field1: Int;
    field2: Bool;
    field3: Address;
    field4: String;
    field5: Cell;
    field6: Slice;
    field7: Int?;
    field8: Bool?;
    field9: Address?;
    field10: String;
}

contract ManyFieldsContract {
    big: LongStruct;

    init() {
        self.big = LongStruct{
            field1: 1,
            field2: false,
            field3: myAddress(),
            field4: "test",
            field5: emptyCell(),
            field6: emptyCell().asSlice(),
            field7: null,
            field8: null,
            field9: null,
            field10: "end",
        };
    }
}