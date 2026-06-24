struct BigNested {
    field1: Int?;
    field2: Bool;
    field3: String?;
    field4: Address;
    field5: Cell;
    field6: Slice?;
    field7: Int;
    field8: Bool?;
    field9: String;
    field10: Address?;
}

contract BigNestedStruct {
    complex: BigNested;

    init() {
        self.complex = BigNested{
            field1: null,
            field2: true,
            field3: null,
            field4: myAddress(),
            field5: emptyCell(),
            field6: null,
            field7: 10,
            field8: null,
            field9: "nested",
            field10: null
        };
    }
}