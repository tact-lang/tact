struct HasOptional {
    a: Int?;
    b: Int?;
    c: Int?;
}

contract OptInStruct {
    s: HasOptional;

    init() {
        self.s = HasOptional{ a:null, b:5, c:null };
    }
}