struct WideStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Cell;
    h: Int;
    i: Bool;
    j: String;
    k: Int?;
    l: Bool?;
    m: String;
    n: Cell;
    o: Int;
    p: Bool;
    q: String;
    r: Int?;
    s: Bool?;
    t: String;
    u: Cell;
    v: Int;
    w: Bool;
    x: String;
    y: Int?;
    z: Bool?;
}

contract WideStructField {
    data: WideStruct;

    init() {
        self.data = WideStruct{
            a:1, b:true, c:"c", d:null, e:null, f:"f", g:emptyCell(),
            h:2, i:false, j:"j", k:null, l:null, m:"m", n:emptyCell(),
            o:3, p:true, q:"q", r:null, s:null, t:"t", u:emptyCell(),
            v:4, w:false, x:"x", y:null, z:null
        };
    }
}
