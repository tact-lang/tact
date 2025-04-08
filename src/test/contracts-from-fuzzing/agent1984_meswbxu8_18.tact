struct Varied {
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

contract AllTypes {
    val: Varied;

    init() {
        self.val = Varied{
            intField: 1,
            boolField: false,
            strField: "hi",
            addrField: myAddress(),
            cellField: emptyCell(),
            sliceField: emptyCell().asSlice(),
            optInt: null,
            optBool: null,
            optStr: null,
            optAddr: null,
            optCell: null,
            optSlice: null,
        };
    }
}