struct Sub {
    q: Int;
    r: Bool?;
}

struct BigOne {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int as uint8;
    h: Int as int16;
    i: Int;
    j: Int?;
    k: Bool;
    l: Bool?;
    m: String;
    n: String?;
    o: Int as uint8;
    p: Int as int16;
    sub1: Sub;
    sub2: Sub?;
    sub3: Sub;
    sub4: Sub?;
}

contract TestContract {
    s: BigOne;
    init() {
        self.s = BigOne{
            a:1, b:null, c:true, d:null, e:"a", f:null,
            g:2, h:-3, i:4, j:null, k:false, l:true,
            m:"b", n:null, o:5, p:-6,
            sub1: Sub{ q:7, r:null },
            sub2: null,
            sub3: Sub{ q:8, r:true },
            sub4: null
        };
    }
}