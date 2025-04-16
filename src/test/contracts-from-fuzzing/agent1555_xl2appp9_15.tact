struct S1 {
    x: Int;
}

struct S2 {
    y: Int;
    nested: S1;
}

struct S3 {
    z: Int;
    nested2: S2;
}

struct S4 {
    w: Int;
    nested3: S3;
}

contract DeepStructChain {
    chain: S4;

    init() {
        self.chain = S4{
            w: 1,
            nested3: S3{
                z:2,
                nested2: S2{
                    y:3,
                    nested: S1{ x:4 }
                }
            }
        };
    }
}
