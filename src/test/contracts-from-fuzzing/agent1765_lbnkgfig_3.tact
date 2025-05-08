struct A {
    field1: Int;
    field2: Bool;
    field3: Address;
    field4: Cell;
    field5: Slice;
    field6: String;
    field7: Int?;
    field8: Bool?;
    field9: Address?;
    field10: Cell?;
    field11: Slice?;
    field12: String?;
}

contract ManyTypes {
    state: A;

    init() {
        self.state = A{
            field1: 1,
            field2: true,
            field3: myAddress(),
            field4: emptyCell(),
            field5: emptyCell().asSlice(),
            field6: "abc",
            field7: null,
            field8: null,
            field9: null,
            field10: null,
            field11: null,
            field12: null
        };
    }
}