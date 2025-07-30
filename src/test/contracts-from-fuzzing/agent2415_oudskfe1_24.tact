struct Complex {
    a: Int;
    b: Bool?;
    c: String;
    d: Int?;
    e: Bool;
    f: String?;
}

contract ComboComplex {
    x: Complex;

    init() {
        self.x = Complex{
            a:1, b:true, c:"hello", d:null, e:false, f:"bye"
        };
    }
}