struct Complex {
    a: Int;
    b: Bool;
    c: String?;
    d: Int?;
    e: Bool?;
}

contract ListOfComplex {
    c1: Complex;
    c2: Complex;

    init() {
        self.c1 = Complex{ a:1, b:true, c:null, d:null, e:null };
        self.c2 = Complex{ a:2, b:false, c:null, d:null, e:null };
    }
}