struct Complex {
    i: Int;
    opti: Int?;
    b: Bool;
    optb: Bool?;
    s: String;
    opts: String?;
}

contract ComplexFields {
    f: Complex = Complex{
        i:0, opti:null, b:true, optb:null, s:"", opts:null
    };
}