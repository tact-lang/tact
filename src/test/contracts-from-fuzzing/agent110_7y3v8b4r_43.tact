struct Diverse {
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

contract DiverseStruct {
    d: Diverse;

    init() {
        self.d = Diverse{
            intVal: 1,
            boolVal: false,
            strVal: "",
            addrVal: myAddress(),
            cellVal: emptyCell(),
            sliceVal: emptyCell().asSlice(),
            optInt: null,
            optBool: null,
            optStr: null,
            optAddr: null,
            optCell: null,
            optSlice: null
        };
    }
}