struct LargeMix {
    i1: Int;
    s1: String;
    b1: Bool;
    a1: Address;
    c1: Cell;
    sl1: Slice;
    i2: Int?;
    s2: String?;
    b2: Bool?;
    a2: Address?;
    c2: Cell?;
    sl2: Slice?;
}

contract LargeMixTest {
    storage: LargeMix;
    init() {
        self.storage = LargeMix{
            i1:1, s1:"abc", b1:true, a1:myAddress(), c1:emptyCell(), sl1:emptyCell().asSlice(),
            i2:null, s2:null, b2:null, a2:null, c2:null, sl2:null
        };
    }
}