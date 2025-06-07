struct ManyMixedTypes {
    intVal: Int;
    boolVal: Bool;
    addrVal: Address;
    strVal: String;
    cellVal: Cell;
    builderVal: Builder;
    sliceVal: Slice;
    optInt: Int?;
    optBool: Bool?;
    optAddr: Address?;
    optStr: String?;
    optCell: Cell?;
}

contract LargeVariedStruct {
    data: ManyMixedTypes;
    init() {
        self.data = ManyMixedTypes{
            intVal: 1,
            boolVal: true,
            addrVal: myAddress(),
            strVal: "abc",
            cellVal: emptyCell(),
            builderVal: beginCell(),
            sliceVal: emptyCell().asSlice(),
            optInt: null,
            optBool: null,
            optAddr: null,
            optStr: null,
            optCell: null
        };
    }
}