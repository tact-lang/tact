struct MixTypes {
    intField: Int;
    boolField: Bool;
    strField: String;
    sliceField: Slice;
    builderField: Builder;
    cellField: Cell;
    addrField: Address;
}

contract MixTypesTest {
    mt: MixTypes;

    init() {
        self.mt = MixTypes{
            intField: 5,
            boolField: true,
            strField: "abc",
            sliceField: emptyCell().asSlice(),
            builderField: beginCell(),
            cellField: emptyCell(),
            addrField: myAddress()
        };
    }
}
