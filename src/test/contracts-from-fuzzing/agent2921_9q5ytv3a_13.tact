struct ManyTypes {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    bu: Builder;
    a: Address;
    iOpt: Int?;
    bOpt: Bool?;
    sOpt: String?;
    cOpt: Cell?;
    slOpt: Slice?;
    buOpt: Builder?;
    aOpt: Address?;
}

contract TypeVariety {
    f: ManyTypes;
    
    init() {
        self.f = ManyTypes{
            i:1, b:true, s:"s", c:emptyCell(), sl:emptyCell().asSlice(), bu:beginCell(),
            a:myAddress(),
            iOpt:null, bOpt:null, sOpt:null, cOpt:null, slOpt:null, buOpt:null, aOpt:null
        };
    }
}
