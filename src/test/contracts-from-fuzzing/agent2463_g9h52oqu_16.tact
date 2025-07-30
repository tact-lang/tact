struct Crazy {
    i: Int;
    j: Int as uint8;
    k: Int as int64;
    l: Int as coins;
    m: Int as int257;
    n: Int?;
    o: Int? as uint8;
    p: Int? as int64;
    q: Int? as coins;
    r: Int? as int257;
}

contract SerializeVariants {
    data: Crazy = Crazy{
        i:0, j:0, k:0, l:0, m:0,
        n:null, o:null, p:null, q:null, r:null
    };

    init() {}
}
