struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract ComplexVars {
    v1: Complex;
    v2: Complex;

    init() {
        self.v1 = Complex{
            a:1, b:true, c:"one", d:null, e: false, f: null
        };
        self.v2 = Complex{
            a:2, b:false, c:"two", d:99, e: null, f: "hi"
        };
    }
}
