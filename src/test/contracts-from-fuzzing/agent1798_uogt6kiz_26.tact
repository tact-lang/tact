struct S {
    a: Int;
    b: String;
    c: Bool;
    d: Address;
    e: Cell;
    f: Builder;
    g: Slice;
    h: Int?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Builder?;
    m: Slice?;
}

contract ComplexFields {
    field: S;
    init() {
        self.field = S{
            a:1, b:"x", c:true, d:myAddress(), e:emptyCell(), f:beginCell(), g:emptyCell().asSlice(),
            h:null, i:null, j:null, k:null, l:null, m:null
        };
    }
}