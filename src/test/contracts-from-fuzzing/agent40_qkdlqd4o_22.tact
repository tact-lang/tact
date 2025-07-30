struct Combo {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    optInt: Int?;
    optBool: Bool?;
    optStr: String?;
    optAddr: Address?;
    optCell: Cell?;
    optSlice: Slice?;
    optBuilder: Builder?;
}

contract StorageCombo {
    combo: Combo;

    init() {
        self.combo = Combo{
            intVal:1,
            boolVal:true,
            strVal:"abc",
            addrVal:myAddress(),
            cellVal:emptyCell(),
            sliceVal:emptyCell().asSlice(),
            builderVal:beginCell(),
            optInt:null,
            optBool:null,
            optStr:null,
            optAddr:null,
            optCell:null,
            optSlice:null,
            optBuilder:null
        };
    }
}