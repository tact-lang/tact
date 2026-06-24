struct BigMix {
    intVal: Int;
    boolVal: Bool;
    strVal: String;
    addrVal: Address;
    cellVal: Cell;
    sliceVal: Slice;
    maybeInt: Int?;
    maybeStr: String?;
    maybeAddr: Address?;
}

contract MixedAll {
    d: BigMix;

    init() {
        self.d = BigMix{
            intVal:1,
            boolVal:true,
            strVal:"hi",
            addrVal:myAddress(),
            cellVal:emptyCell(),
            sliceVal:emptyCell().asSlice(),
            maybeInt:null,
            maybeStr:null,
            maybeAddr:null
        };
    }
}