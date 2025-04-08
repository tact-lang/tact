struct BigFlat {
    a: Int;
    b: Int as uint8;
    c: Int as int16;
    d: Int as coins;
    e: Bool;
    f: Address?;
    g: Cell;
    h: Slice;
    i: String;
    j: Bool;
    k: Int;
    l: Int as uint8;
    m: Int as int16;
    n: Int as coins;
    o: Address?;
    p: String;
    q: Bool;
    r: Int;
    s: Cell;
    t: Slice;
}

contract ManyFields {
    data: BigFlat;

    init() {
        self.data = BigFlat{
            a:1, b:2, c:3, d:4, e:true, f:null, g:emptyCell(), h:emptyCell().asSlice(),
            i:"hi", j:false, k:11, l:12, m:13, n:14, o:null, p:"zz", q:true, r:21, s:emptyCell(), t:emptyCell().asSlice()
        };
    }
}
