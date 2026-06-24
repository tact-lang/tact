struct LongStruct {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String;
    m: Int;
    n: Bool;
    o: String;
    p: Int?;
    q: Bool?;
    r: String;
    s: Int;
    t: Bool;
}

contract LongStructContract {
    s: LongStruct;

    init() {
        self.s = LongStruct{
            a:1, b:true, c:"c", d:null, e:null, f:"f", g:2, h:false, i:"i", j:null,
            k:null, l:"l", m:3, n:true, o:"o", p:null, q:null, r:"r", s:4, t:false
        };
    }
}