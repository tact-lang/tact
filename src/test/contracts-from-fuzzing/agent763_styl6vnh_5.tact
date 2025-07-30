struct MixedTypes {
    field1: Int;
    field2: Bool;
    field3: String;
    field4: Cell;
    field5: Slice;
    field6: Address;
    field7: Builder;
}

contract MixedTypesContract {
    storage: MixedTypes;

    init() {
        self.storage = MixedTypes{
            field1: 1,
            field2: true,
            field3: "test",
            field4: emptyCell(),
            field5: emptyCell().asSlice(),
            field6: myAddress(),
            field7: beginCell()
        };
    }
}