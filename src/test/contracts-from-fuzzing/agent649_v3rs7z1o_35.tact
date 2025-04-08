struct Complex {
    i: Int;
    b: Bool;
    s: String;
    o: Int?;
    oo: String?;
}

contract ManyComplexFields {
    a: Complex;
    b: Complex;

    init() {
        self.a = Complex{ i:1, b:true, s:"a", o:null, oo:null };
        self.b = Complex{ i:2, b:false, s:"b", o:null, oo:null };
    }
}