struct LargeMix {
    a: Int; b: Int?; c: Bool; d: Bool?; e: String; f: String?;
    g: Int; h: Int?; i: Bool; j: Bool?; k: String; l: String?;
    m: Int; n: Int?; o: Bool; p: Bool?; q: String; r: String?;
}

contract Mega {
    val: LargeMix;

    init() {
        self.val = LargeMix{
            a:1, b:null, c:true, d:false, e:"x", f:null,
            g:2, h:3, i:false, j:true, k:"y", l:null,
            m:4, n:null, o:true, p:null, q:"z", r:"q"
        };
    }
}