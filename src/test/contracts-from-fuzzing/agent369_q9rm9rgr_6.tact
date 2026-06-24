struct MixTypes {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    builderField: Builder;
    sliceField: Slice;
    stringField: String;
}

contract TestContract {
    mixed: MixTypes;

    init() {
        self.mixed = MixTypes{
            intField: 1,
            boolField: true,
            addrField: myAddress(),
            cellField: emptyCell(),
            builderField: beginCell(),
            sliceField: emptyCell().asSlice(),
            stringField: "hello"
        };
    }
}