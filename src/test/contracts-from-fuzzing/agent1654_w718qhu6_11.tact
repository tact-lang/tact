struct S1 {
    v1: Int;
}

struct S2 {
    v2: Int;
    s1: S1;
}

struct S3 {
    v3: Int;
    s2: S2;
}

contract DeepChain {
    root: S3;

    init() {
        self.root = S3{
            v3: 3,
            s2: S2{
                v2: 2,
                s1: S1{
                    v1: 1
                }
            }
        };
    }
}