struct Container {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Cell;
    field5: Slice;
    field6: Address;
    field7: Int?;
    field8: Bool?;
    field9: String?;
    field10: Cell?;
    field11: Slice?;
    field12: Address?;
}

contract TestContract {
    storage: Container;

    init() {
        self.storage = Container{
            field1: 1,
            field2: false,
            field3: "hi",
            field4: emptyCell(),
            field5: emptyCell().asSlice(),
            field6: myAddress(),
            field7: null,
            field8: null,
            field9: null,
            field10: null,
            field11: null,
            field12: null,
        };
    }
}