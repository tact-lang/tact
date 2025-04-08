struct Complex {
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
}

contract ComplexFields {
    s: Complex;
    init() {
        self.s = Complex{
            a:1, b:true, c:"hi", d: null, e: false, f: null, g:5, h:false, i:"bye", j: 10
        };
    }
}
