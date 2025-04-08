struct Combo {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
}

contract ComboFields {
    data: Combo;

    init() {
        self.data = Combo{
            intVal: 1,
            boolVal: true,
            strVal: "hi",
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            optInt: null,
            optBool: false,
            optStr: null,
            optAddr: null,
            optCell: null,
            optSlice: null,
        };
    }
}