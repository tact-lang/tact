struct Wide {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
    g: Int;
    h: Bool;
    i: String;
    j: Int?;
    k: Bool?;
    l: String?;
}

contract Test {
    w: Wide;

    init() {
        self.w = Wide{
            a:1, b:true, c:"hi", d:null, e:null, f:null,
            g:2, h:false, i:"bye", j:null, k:null, l:null
        };
    }
}
