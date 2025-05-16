struct ManyKinds {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    cellVal: Cell;
    sliceVal: Slice;
    builderVal: Builder;
    addrVal: Address;
    optInt: Int?;
    optStr: String?;
    optBool: Bool?;
}

contract ManyKindsContract {
    data: ManyKinds;

    init() {
        self.data = ManyKinds{
            intVal:1,
            boolVal:true,
            strVal:"hi",
            cellVal:emptyCell(),
            sliceVal:emptyCell().asSlice(),
            builderVal:beginCell(),
            addrVal:myAddress(),
            optInt:null,
            optStr:null,
            optBool:null
        };
    }
}