struct BigS {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Slice;
    f: Cell;
    g: Builder;
    h: Int?;
    i: String?;
    j: Bool?;
    k: Address?;
    l: Cell?;
    m: Slice?;
    n: Builder?;
}

contract StructBigS {
    data: BigS;

    init() {
        self.data = BigS{
            a:1, b:true, c:"a", d:myAddress(), e:emptyCell().asSlice(),
            f:emptyCell(), g:beginCell(), h:null, i:null, j:null, k:null, l:null, m:null, n:null
        };
    }
}
