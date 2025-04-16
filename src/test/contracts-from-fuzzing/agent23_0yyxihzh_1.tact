struct Inner {
    nested1: Int;
    nested2: Bool;
}

struct Outer {
    field1: Int;
    field2: Bool;
    field3: Inner;
    field4: String;
    field5: Cell;
    field6: Slice;
    field7: Address;
    field8: Int?;
    field9: String?;
    field10: Inner?;
}

contract NestedFieldsTest {
    data: Outer;

    init() {
        self.data = Outer{
            field1: 42,
            field2: true,
            field3: Inner{ nested1: 1, nested2: false },
            field4: "test",
            field5: emptyCell(),
            field6: emptyCell().asSlice(),
            field7: myAddress(),
            field8: null,
            field9: null,
            field10: null
        };
    }
}