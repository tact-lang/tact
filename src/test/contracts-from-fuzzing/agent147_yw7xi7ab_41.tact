struct BigMix {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Slice;
    f: Cell;
    g: Int?;
    h: String?;
    i: Bool?;
    j: Address?;
    k: Slice?;
    l: Cell?;
}
contract BM {
    val: BigMix;
    init() {
        self.val = BigMix{
            a:1, b:"b", c:true, d:myAddress(), e:emptyCell().asSlice(), f:emptyCell(),
            g:null, h:null, i:null, j:null, k:null, l:null
        };
    }
}