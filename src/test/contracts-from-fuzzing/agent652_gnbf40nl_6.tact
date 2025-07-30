struct NestedStructWithVariousTypes {
    intField: Int;
    boolField: Bool;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
    addressField: Address;
}

contract TestContract {
    data: NestedStructWithVariousTypes;

    init() {
        self.data = NestedStructWithVariousTypes{
            intField: 1,
            boolField: true,
            stringField: "hello",
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            addressField: myAddress(),
        };
    }
}