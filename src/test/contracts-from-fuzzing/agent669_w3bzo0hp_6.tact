struct LongList {
    a: Int;
    b: Bool;
    c: Int;
    d: Bool;
    e: Int;
    f: Bool;
    g: Int;
    h: Bool;
    i: Int;
    j: Bool;
    k: Int;
    l: Bool;
    m: Int;
    n: Bool;
    o: Int;
    p: Bool;
    q: Int;
    r: Bool;
    s: Int;
    t: Bool;
}

contract LongListContract {
    data: LongList;

    init() {
        self.data = LongList{
            a:1, b:true, c:2, d:false, e:3, f:true, g:4, h:false, i:5, j:true,
            k:6, l:false, m:7, n:true, o:8, p:false, q:9, r:true, s:10, t:false
        };
    }
}
