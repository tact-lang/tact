struct Large {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Address;
    h: Address?;
    i: Cell;
    j: Cell?;
    k: Int;
    l: Int?;
    m: Bool;
    n: Bool?;
    o: String;
    p: String?;
    q: Address;
    r: Address?;
    s: Cell;
    t: Cell?;
    u: Int;
}

contract TestContract {
    big: Large;

    init() {
        self.big = Large{
            a:1, b:null, c:true, d:false, e:"e", f:null, g:myAddress(), h:null,
            i:emptyCell(), j:null, k:2, l:null, m:false, n:null, o:"o", p:null,
            q:myAddress(), r:null, s:emptyCell(), t:null, u:3
        };
    }
}
