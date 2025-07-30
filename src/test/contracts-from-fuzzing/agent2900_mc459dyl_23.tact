struct Alternating {
    a: Int;
    b: Int?;
    c: Bool;
    d: Bool?;
    e: String;
    f: String?;
    g: Int;
    h: Int?;
}

contract AlternAlt {
    f: Alternating;

    init() {
        self.f = Alternating{
            a:1, b: null, c:true, d:null, e:"hi", f:null, g:2, h:null,
        };
    }
}
