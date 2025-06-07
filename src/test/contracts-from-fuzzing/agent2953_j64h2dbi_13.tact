struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

contract DeepChain {
    d: S3;

    init() {
        self.d = S3{
            s2: S2{
                s1: S1{
                    a: 123
                }
            }
        };
    }
}