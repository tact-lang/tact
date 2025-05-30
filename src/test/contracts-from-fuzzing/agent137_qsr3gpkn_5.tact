struct MixTypes {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    sliceField: Slice;
    cellField: Cell;
    builderField: Builder;
    strField: String;
}

contract MixedFieldsTest {
    data: MixTypes;

    init() {
        self.data = MixTypes{
            intField: 1,
            boolField: true,
            addrField: myAddress(),
            sliceField: emptyCell().asSlice(),
            cellField: emptyCell(),
            builderField: beginCell(),
            strField: "hello"
        };
    }

    receive() {}
}