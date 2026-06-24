struct MixedTypes {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
}

contract MixedContract {
    data: MixedTypes;

    init() {
        self.data = MixedTypes{
            intField: 1,
            boolField: true,
            addrField: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            stringField: "hi",
            optInt: null,
            optBool: null,
            optAddr: null
        };
    }
}
