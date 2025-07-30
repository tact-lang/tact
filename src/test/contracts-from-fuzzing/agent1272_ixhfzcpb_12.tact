struct Diverse {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    sliceVal: Slice;
    cellVal: Cell;
    addrVal: Address;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
    optSlice: Slice?;
    optCell: Cell?;
    optAddr: Address?;
}

contract AllOpt {
    val: Diverse;
    init() {
        self.val = Diverse{
            intVal: 1,
            boolVal: true,
            strVal: "s",
            sliceVal: emptyCell().asSlice(),
            cellVal: emptyCell(),
            addrVal: myAddress(),
            optInt: null,
            optStr: null,
            optBool: null,
            optSlice: null,
            optCell: null,
            optAddr: null
        };
    }
}
