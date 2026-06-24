// very large struct with mixed optional and non optional fields
struct L {
    a: Int; b: Int?; c: Bool; d: Bool?; e: String; f: String?;
    g: Int; h: Int?; i: Bool; j: Bool?; k: String; l: String?;
    m: Int; n: Int?; o: Bool; p: Bool?; q: String; r: String?;
    s: Int; t: Int?;
}

contract LargeContract {
    big: L;

    init() {
        self.big = L{
            a:1, b:null, c:true, d:null, e:"", f:null,
            g:2, h:null, i:false, j:null, k:"", l:null,
            m:3, n:null, o:true, p:null, q:"", r:null,
            s:4, t:null
        };
    }
}