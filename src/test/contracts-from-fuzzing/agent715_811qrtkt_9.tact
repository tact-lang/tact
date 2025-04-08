struct Large {
    a: Int; b: Bool; c: String; d: Int?; e: Bool?; f: String?;
    g: Int; h: Bool; i: String; j: Int?; k: Bool?; l: String?;
    m: Int; n: Bool; o: String; p: Int?; q: Bool?; r: String?;
    s: Int; t: Bool; u: String; v: Int?; w: Bool?; x: String?;
}

contract LargeFields {
    fld: Large;

    init() {
        self.fld = Large{
            a:1, b:true, c:"a", d:null, e:false, f:null,
            g:2, h:false, i:"b", j:null, k:true, l:null,
            m:3, n:true, o:"c", p:null, q:false, r:null,
            s:4, t:true, u:"d", v:null, w:false, x:null
        };
    }
}