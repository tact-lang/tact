struct SF {
    a: Int;
    b: Bool;
}

// Testing array-like multiple same type nested fields
contract ManySameStructs {
    s1: SF;
    s2: SF;
    s3: SF;

    init() {
        self.s1 = SF{a:1,b:true};
        self.s2 = SF{a:2,b:false};
        self.s3 = SF{a:3,b:true};
    }
}
