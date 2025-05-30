struct LongStruct {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Int;
    field5: Bool;
    field6: String;
    field7: Int;
    field8: Bool;
    field9: String;
    field10: Int;
    field11: Bool;
    field12: String;
    field13: Int;
    field14: Bool;
    field15: String;
}

contract LongStorage {
    longField: LongStruct;

    init() {
        self.longField = LongStruct{
            field1: 1,
            field2: true,
            field3: "a",
            field4: 2,
            field5: false,
            field6: "b",
            field7: 3,
            field8: true,
            field9: "c",
            field10: 4,
            field11: false,
            field12: "d",
            field13: 5,
            field14: true,
            field15: "e",
        };
    }
}