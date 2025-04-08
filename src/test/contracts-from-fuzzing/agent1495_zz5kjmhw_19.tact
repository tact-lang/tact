struct XLarge {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Slice;
    l: Slice?;
    m: Builder;
    n: Builder?;
    o: String;
    p: Int;
}

contract BigState {
    st: XLarge;

    init() {
        self.st = XLarge{
            a:1, b:true, c:"hi", d:null, e:null, f:null,
            g:myAddress(), h:null, i:emptyCell(), j:null,
            k:emptyCell().asSlice(), l:null, m:beginCell(), n:null,
            o:"bye", p:999
        };
    }
}
