struct MixedPrimitives {
    intField: Int;
    boolField: Bool;
    addressField: Address;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;
    stringField: String;
}

contract MixedPrimitivesContract {
    data: MixedPrimitives;

    init() {
        self.data = MixedPrimitives{
            intField: 1,
            boolField: true,
            addressField: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            builderField: beginCell(),
            stringField: "test"
        };
    }
}