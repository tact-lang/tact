struct HasAll {
    i: Int;
    b: Bool;
    s: String;
    c: Cell;
    sl: Slice;
    addr: Address;
    optI: Int?;
    optB: Bool?;
    optS: String?;
    optAddr: Address?;
}

contract StructWithOptionals {
    f: HasAll;

    init() {
        self.f = HasAll{
            i:1, b:true, s:"hi", c: emptyCell(), sl:emptyCell().asSlice(), addr:myAddress(),
            optI:null, optB:null, optS:null, optAddr:null
        };
    }
}