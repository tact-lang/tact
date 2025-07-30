struct Wrapper {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    stringField: String;
    optInt: Int?;
    optBool: Bool?;
    optString: String?;
}

contract StructWithOptionals {
    data: Wrapper;

    init() {
        self.data = Wrapper{
            intField: 1,
            boolField: true,
            addrField: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            stringField: "hi",
            optInt: null,
            optBool: null,
            optString: null,
        };
    }
}