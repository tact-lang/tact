struct Complex {
    a: Int;
    b: Bool;
    c: String?;
    d: Int?;
    e: Bool?;
    f: String;
    g: Int;
    h: Bool;
    i: String?;
    j: Int?;
    k: Bool?;
    l: String;
}

contract LotsMixed {
    state: Complex;

    init() {
        self.state = Complex{
            a:10, b:true, c:null, d:null, e:null, f:"ok",
            g:20, h:false, i:null, j:null, k:null, l:"done"
        };
    }
}