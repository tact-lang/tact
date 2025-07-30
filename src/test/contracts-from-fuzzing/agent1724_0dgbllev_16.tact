struct Complex {
    a: Int;
    b: Bool;
    c: Int?;
    d: Bool?;
}

contract ComplexFields {
    c1: Complex;
    c2: Complex?;

    init() {
        self.c1 = Complex{ a:1, b:true, c:null, d:null };
        self.c2 = null;
    }
}