struct Complex {
    a: Int as int64;
    b: Int?;
    c: Bool;
    d: String?;
    e: Int;
    f: String;
}

contract ComplexFields {
    s: Complex;

    init() {
        self.s = Complex{ a:10, b:null, c:true, d:null, e:5, f:"hi" };
    }
}