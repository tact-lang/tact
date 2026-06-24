struct Complex {
    a: Int;
    b: Bool;
    c: String;
    opt: String?;
}

contract ComplexFields {
    f1: Complex;
    f2: Complex;

    init() {
        self.f1 = Complex{a:1, b:true, c:"x", opt:null};
        self.f2 = Complex{a:2, b:false, c:"y", opt:"hi"};
    }
}