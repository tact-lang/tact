struct Mixed {
    intVal: Int;
    boolVal: Bool;
    optInt: Int?;
    optBool: Bool?;
    strVal: String;
    optStr: String?;
    addrVal: Address;
    optAddr: Address?;
    cellVal: Cell;
    optCell: Cell?;
    sliceVal: Slice;
    optSlice: Slice?;
}

contract MixedFields {
    data: Mixed;

    init() {
        self.data = Mixed{
            intVal: 1,
            boolVal: true,
            optInt: null,
            optBool: null,
            strVal: "hi",
            optStr: null,
            addrVal: myAddress(),
            optAddr: null,
            cellVal: emptyCell(),
            optCell: null,
            sliceVal: emptyCell().asSlice(),
            optSlice: null,
        };
    }
}