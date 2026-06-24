struct A {
    intField: Int;
    boolField: Bool;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;
    addressField: Address;
}

contract AllTypesTest {
    s: A;

    init() {
        self.s = A{
            intField: 1,
            boolField: true,
            stringField: "test",
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            builderField: beginCell(),
            addressField: myAddress(),
        };
    }
}
