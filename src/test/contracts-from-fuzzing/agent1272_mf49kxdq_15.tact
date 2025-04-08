struct LotsOfOptionals {
    a: Int?;
    b: Int?;
    c: Int?;
    d: Int?;
    e: Int?;
    f: Int?;
    g: Int?;
    h: Int?;
    i: Int?;
    j: Int?;
    k: Int?;
    l: Int?;
    m: Int?;
    n: Int?;
    o: Int?;
    p: Int?;
    q: Int?;
    r: Int?;
    s: Int?;
    t: Int?;
}

contract LotsOptContract {
    s: LotsOfOptionals;

    init() {
        self.s = LotsOfOptionals{
            a:null, b:null, c:null, d:null, e:null,
            f:null, g:null, h:null, i:null, j:null,
            k:null, l:null, m:null, n:null, o:null,
            p:null, q:null, r:null, s:null, t:null
        };
    }
}