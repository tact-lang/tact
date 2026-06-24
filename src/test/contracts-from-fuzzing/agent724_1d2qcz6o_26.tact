struct Big {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: Int as uint8;
    f: Int? as uint8;
    g: String;
    h: String?;
    i: Int;
    j: Int?;
    k: Bool;
    l: Bool?;
    m: Int as uint16;
    n: Int? as uint16;
    o: String;
    p: String?;
    q: Int;
    r: Int?;
    s: Bool;
    t: Bool?;
}

contract TestContract {
    big: Big;

    init() {
        self.big = Big{
            a:1, b:null, c:true, d:null, e:5, f:null, g:"a", h:null,
            i:2, j:null, k:false, l:null, m:6, n:null, o:"b", p:null,
            q:3, r:null, s:true, t:null
        };
    }
}