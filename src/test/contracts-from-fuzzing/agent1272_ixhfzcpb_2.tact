struct Mix {
    field1: Int;
    field2: String;
    field3: Bool;
    field4: Slice;
    field5: Cell;
    field6: Address;
    field7: String?;
    field8: Int?;
}

contract MixedFields {
    data: Mix;
    
    init() {
        self.data = Mix{
            field1: 1,
            field2: "hi",
            field3: true,
            field4: emptyCell().asSlice(),
            field5: emptyCell(),
            field6: myAddress(),
            field7: null,
            field8: null
        };
    }
}
