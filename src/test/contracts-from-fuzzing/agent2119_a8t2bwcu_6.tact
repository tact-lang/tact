struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

struct S4 {
    s3: S3;
}

contract DeepSingleChain {
    data: S4;

    init() {
        self.data = S4{
            s3: S3{
                s2: S2{
                    s1: S1{ a: 77 }
                }
            }
        };
    }
}
