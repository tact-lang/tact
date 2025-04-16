struct SubStruct {
    val: Int;
}

struct FullStruct {
    intField: Int;
    boolField: Bool;
    addrField: Address;
    cellField: Cell;
    sliceField: Slice;
    strField: String;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optStr: String?;
    nested: SubStruct;
    optNested: SubStruct?;
}

contract ComboStore {
    data: FullStruct;

    init() {
        self.data = FullStruct{
            intField:1,
            boolField:true,
            addrField:myAddress(),
            cellField:emptyCell(),
            sliceField:emptyCell().asSlice(),
            strField:"hi",
            optInt: null,
            optBool: null,
            optAddr: null,
            optCell: null,
            optSlice: null,
            optStr: null,
            nested: SubStruct{ val: 7 },
            optNested: null
        };
    }
}
