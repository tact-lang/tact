struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    s1: S1;
}

struct S3 {
    c: Int;
    s2: S2;
}

struct S4 {
    d: Int;
    s3: S3;
}

contract DeepChain {
    data: S4;

    init() {
        self.data = S4{
            d: 4,
            s3: S3{
                c: 3,
                s2: S2{
                    b: 2,
                    s1: S1{
                        a: 1
                    }
                }
            }
        };
    }
}