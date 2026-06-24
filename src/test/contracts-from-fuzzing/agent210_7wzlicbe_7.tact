struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ComplexStorage {
    f0: Int = 0;
    f1: Complex;
    f2: Complex;
    f3: Complex;

    init() {
        self.f1 = Complex{ a:1, b:true, c:"x", d:null, e:null, f:null };
        self.f2 = Complex{ a:2, b:false, c:"y", d:null, e:null, f:null };
        self.f3 = Complex{ a:3, b:true, c:"z", d:null, e:null, f:null };
    }
}