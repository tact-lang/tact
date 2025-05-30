struct ManyPrimitives {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    stringField: String;
    cellField: Cell;
    builderField: Builder;
    sliceField: Slice;
}

contract TestManyPrim {
    data: ManyPrimitives;

    init() {
        self.data = ManyPrimitives{
            intField: 42,
            boolField: true,
            addressField: myAddress(),
            stringField: "test",
            cellField: emptyCell(),
            builderField: beginCell(),
            sliceField: emptyCell().asSlice()
        };
    }
}
