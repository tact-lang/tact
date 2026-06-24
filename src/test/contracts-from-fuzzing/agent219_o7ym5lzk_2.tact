struct LargeStruct {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Int?;
    field5: Bool?;
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
    field16: Int;
}

contract ManyFieldsTest {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            field1: 1,
            field2: true,
            field3: "a",
            field4: null,
            field5: null,
            field6: "b",
            field7: 7,
            field8: false,
            field9: "c",
            field10: 10,
            field11: true,
            field12: "d",
            field13: 13,
            field14: false,
            field15: "e",
            field16: 16
        };
    }
}