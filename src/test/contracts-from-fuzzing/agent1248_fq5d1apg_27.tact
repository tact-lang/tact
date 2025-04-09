struct Complex {
    i: Int;
    b: Bool;
    s: String;
    ci: Int?;
    cb: Bool?;
    cs: String?;
}

contract VariousFields {
    c: Complex;

    init() {
        self.c = Complex{i:1,b:true,s:"s",ci:null,cb:false,cs:"sss"};
    }
}
