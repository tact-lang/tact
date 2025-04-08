struct MixTypes {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    stringField: String;
    cellField: Cell;
    sliceField: Slice;
    builderField: Builder;
}

contract MixedPersistence {
    data: MixTypes;

    init() {
        self.data = MixTypes{
            intField: 77,
            boolField: true,
            addrField: myAddress(),
            stringField: "test",
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            builderField: beginCell()
        };
    }
}