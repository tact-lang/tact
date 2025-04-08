struct Composite {
    s: String;
    i: Int;
    b: Bool;
    c: Cell;
    sl: Slice;
    a: Address;
    sOpt: String?;
    iOpt: Int?;
    bOpt: Bool?;
    cOpt: Cell?;
    slOpt: Slice?;
    aOpt: Address?;
}

contract CompositeContract {
    storage: Composite;
    init() {
        self.storage = Composite{
            s:"x", i:1, b:true, c:emptyCell(), sl:emptyCell().asSlice(), a:myAddress(),
            sOpt:null,iOpt:null,bOpt:null,cOpt:null,slOpt:null,aOpt:null
        };
    }
}