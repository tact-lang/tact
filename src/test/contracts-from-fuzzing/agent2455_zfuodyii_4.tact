struct LargeStruct {
    field1: Int;
    field2: Bool;
    field3: Address;
    field4: Slice;
    field5: String;
    field6: Int?;
    field7: Bool?;
    field8: Address?;
    field9: Cell;
    field10: Cell?;
    field11: Slice;
    field12: String;
    field13: Int;
    field14: Bool;
}

contract LargeStructStorage {
    data: LargeStruct;

    init() {
        self.data = LargeStruct{
            field1: 1,
            field2: true,
            field3: myAddress(),
            field4: emptyCell().asSlice(),
            field5: "test",
            field6: null,
            field7: null,
            field8: null,
            field9: emptyCell(),
            field10: null,
            field11: emptyCell().asSlice(),
            field12: "hello",
            field13: 42,
            field14: false
        };
    }
}