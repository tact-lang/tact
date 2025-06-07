struct Complex {
    a: Int = 1;
    b: Bool = true;
    c: String = "hello";
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ComplexInit {
    s: Complex;

    init() {
        self.s = Complex{ d:null, e:null, f:null };
    }
}