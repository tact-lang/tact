struct S1 { 
    a: Int; 
    b: String?; 
}

struct S2 {
    s1: S1;
    c: Bool;
}

struct S3 {
    s2: S2;
    d: Int?;
}

contract StructChain {
    chain: S3;

    init() {
        self.chain = S3{
            s2: S2{
                s1: S1{a: 5, b: null},
                c: true
            },
            d: 42
        };
    }
}