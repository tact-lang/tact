struct MultiplePrimitives {
    intField: Int;
    boolField: Bool;
    stringField: String;
    sliceField: Slice;
    cellField: Cell;
    builderField: Builder;
    addressField: Address;
}

contract MultiPrimitiveState {
    data: MultiplePrimitives;

    init() {
        self.data = MultiplePrimitives{
            intField: 42,
            boolField: true,
            stringField: "abc",
            sliceField: "hello".asComment().asSlice(),
            cellField: emptyCell(),
            builderField: beginCell(),
            addressField: myAddress(),
        };
    }
}
