struct DeepOne {
    intField: Int;
    boolField: Bool;
    strField: String;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
}

contract DeepFields {
    f: DeepOne;

    init() {
        self.f = DeepOne{
            intField: 42,
            boolField: false,
            strField: "foo",
            addrField: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            optInt: null,
            optBool: null,
            optStr: null,
            optAddr: null,
            optCell: null,
            optSlice: null
        };
    }
}