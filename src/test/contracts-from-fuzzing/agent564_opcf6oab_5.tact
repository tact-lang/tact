struct BigStruct {
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
    m: Int;
    n: Bool;
    o: String;
    p: Address;
    q: Cell;
    r: Slice;
    s: Int?;
    t: Bool?;
}

contract BigStructTest {
    data: BigStruct;

    init() {
        self.data = BigStruct{
            a:1, b:true, c:"hi", d:myAddress(), e:emptyCell(), f:emptyCell().asSlice(),
            g:null, h:false, i:null, j:myAddress(), k:emptyCell(), l:emptyCell().asSlice(),
            m:2, n:false, o:"bye", p:myAddress(), q:emptyCell(), r:emptyCell().asSlice(),
            s:123, t:true
        };
    }
}
