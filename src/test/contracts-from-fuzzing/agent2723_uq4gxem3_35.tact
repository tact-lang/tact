struct Complex {
    a: Int;
    b: Bool;
    c: String;
    d: Int?;
    e: Bool?;
    f: String?;
}

contract MixedFields {
    c: Complex;
    init() {
        self.c = Complex{
            a:1,
            b:true,
            c:"x",
            d:null,
            e:false,
            f:null
        };
    }
}