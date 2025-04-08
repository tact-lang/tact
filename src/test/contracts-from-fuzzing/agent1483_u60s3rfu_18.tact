struct S1 {
    s2: S2;
}

struct S2 {
    s3: S3;
}

struct S3 {
    s4: S4;
}

struct S4 {
    value: Int;
}

contract DeepChain {
    chain: S1;

    init() {
        self.chain = S1{
            s2: S2{
                s3: S3{
                    s4: S4{value: 123}
                }
            }
        };
    }
}