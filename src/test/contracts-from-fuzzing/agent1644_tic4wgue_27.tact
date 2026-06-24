struct Complex {
    i: Int;
    s: String;
    b: Bool;
    oi: Int?;
    os: String?;
    ob: Bool?;
}

contract MixedFields {
    c: Complex;

    init() {
        self.c = Complex{
            i:1, s:"", b:false, oi:null, os:null, ob:null
        };
    }
}