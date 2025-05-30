struct Mixed {
    intVal: Int;
    optVal: Int?;
    boolVal: Bool;
    optBool: Bool?;
    addr: Address;
    optAddr: Address?;
    cellVal: Cell;
    optCell: Cell?;
    sliceVal: Slice;
    optSlice: Slice?;
    strVal: String;
    optStr: String?;
}

contract MixedFields {
    data: Mixed;

    init() {
        self.data = Mixed{
            intVal:1,optVal:null,boolVal:true,optBool:null,
            addr:myAddress(),optAddr:null,cellVal:emptyCell(),optCell:null,
            sliceVal:emptyCell().asSlice(),optSlice:null,
            strVal: "hello", optStr: null
        };
    }
}