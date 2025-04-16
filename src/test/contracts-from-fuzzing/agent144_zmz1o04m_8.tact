struct BigComposite {
    a: Int;
    b: Bool;
    c: String;
    d: Address;
    e: Cell;
    f: Slice;
    g: Int?;
    h: Bool?;
    i: String?;
    j: Address?;
    k: Cell?;
    l: Slice?;
    n1: InnerNested;
    n2: InnerNested?;
}

struct InnerNested {
    p: Int;
    q: Bool;
    r: String?;
}

contract HugeStructTest {
    big: BigComposite;

    init() {
        self.big = BigComposite{
            a:0, b:false, c:"", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice(),
            g:null, h:null, i:null, j:null, k:null, l:null,
            n1: InnerNested{ p:0, q:false, r:null },
            n2: InnerNested{ p:0, q:false, r:null },
        };
    }
}