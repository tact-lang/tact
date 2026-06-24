struct Combo {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    sliceVal: Slice;
    addrVal: Address;
    cellVal: Cell;

    intOpt: Int?;
    boolOpt: Bool?;
    strOpt: String?;
    sliceOpt: Slice?;
    addrOpt: Address?;
    cellOpt: Cell?;
}

contract Test {
    store: Combo;

    init() {
        self.store = Combo{
            intVal:1,boolVal:true,strVal:"x",sliceVal:emptyCell().asSlice(),addrVal:myAddress(),cellVal:emptyCell(),
            intOpt:null,boolOpt:null,strOpt:null,sliceOpt:null,addrOpt:null,cellOpt:null
        };
    }
}