struct LongStruct {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: String?;
    field5: Bool;
    field6: Int;
    field7: String;
    field8: Int;
    field9: Int;
    field10: String;
}

contract ManyFields {
    data: LongStruct;
    init() {
        self.data = LongStruct{
            field1: 1,
            field2: false,
            field3: "a",
            field4: null,
            field5: true,
            field6: 6,
            field7: "b",
            field8: 8,
            field9: 9,
            field10: "c"
        };
    }
}