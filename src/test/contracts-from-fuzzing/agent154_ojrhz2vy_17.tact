struct MixOptReg {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Address;
    f: Address?;
    g: String;
    h: String?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;
    m: Builder;
    n: Builder?;
}

contract MixedOptionalRegular {
    data: MixOptReg;

    init() {
        self.data = MixOptReg{
            a:1, b:null, c:true, d:null, e:myAddress(), f:null, g:"a", h:null,
            i:emptyCell(), j:null, k:emptyCell().asSlice(), l:null, m:beginCell(), n:null
        };
    }
}