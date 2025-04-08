struct ManyPrimitives {
    intField: Int;
    boolField: Bool;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;
    addressField: Address;
}

contract Test {
    data: ManyPrimitives;

    init() {
        self.data = ManyPrimitives{
            intField: 1,
            boolField: true,
            stringField: "abc",
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            builderField: beginCell(),
            addressField: myAddress(),
        };
    }
}