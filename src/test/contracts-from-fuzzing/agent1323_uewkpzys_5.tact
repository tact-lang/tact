struct ManyFields {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Builder;
    g: Slice;
    h: Int?;
    i: Bool?;
    j: String?;
    k: Address?;
    l: Cell?;
    m: Builder?;
    n: Slice?;
}

contract StructManyFields {
    s: ManyFields;

    init() {
        self.s = ManyFields{
            a:1, b:true, c:"x", d:myAddress(), e:emptyCell(), f:beginCell(), g:emptyCell().asSlice(),
            h:null, i:null, j:null, k:null, l:null, m:null, n:null
        };
    }
}
