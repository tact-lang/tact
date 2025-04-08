struct S1 {
    v: Int?;
}

struct S2 {
    s: S1?;
}

struct S3 {
    s2: S2?;
}

contract NestedOptChain {
    chain: S3;
    init() {
        self.chain = S3{
            s2: S2{
                s: S1{
                    v: null
                }
            }
        };
    }
}
