struct StringMix {
    a: String;
    b: String?;
    c: String;
    d: String?;
}

contract StringMixContract {
    m: StringMix;
    init() {
        self.m = StringMix{a:"A",b:null,c:"C",d:null};
    }
}