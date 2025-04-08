struct BigMix {
    intField: Int;
    optInt: Int?;
    boolField: Bool;
    optBool: Bool?;
    strField: String;
    optStr: String?;
    addr: Address;
    optAddr: Address?;
    cell: Cell;
    optCell: Cell?;
    slice: Slice;
    optSlice: Slice?;
}

contract BigMixContract {
    data: BigMix;

    init() {
        self.data = BigMix{
            intField: 1,
            optInt: null,
            boolField: true,
            optBool: null,
            strField: "s",
            optStr: null,
            addr: myAddress(),
            optAddr: null,
            cell: emptyCell(),
            optCell: null,
            slice: "hi".asComment().asSlice(),
            optSlice: null
        };
    }
}
