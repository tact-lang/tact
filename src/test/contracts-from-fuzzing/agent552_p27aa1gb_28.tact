struct BigStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Cell;
    e: Slice;
    f: Address;
    g: Int;
    h: Bool;
    i: String;
    j: Cell;
    k: Slice;
    l: Address;
    m: Int?;
    n: Bool?;
    o: String?;
    p: Cell?;
    q: Slice?;
    r: Address?;
    s: Int;
    t: Bool;
}

contract TestContract {
    big: BigStruct;

    init() {
        self.big = BigStruct{
            a:1, b:true, c:"c", d:emptyCell(), e:emptyCell().asSlice(), f:myAddress(),
            g:2, h:false, i:"i", j:emptyCell(), k:emptyCell().asSlice(), l:myAddress(),
            m:null, n:null, o:null, p:null, q:null, r:null,
            s:3, t:true
        };
    }
}