struct S1 {
    i: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

contract LongChain {
    deep: S3;

    init() {
        self.deep = S3{
            s2: S2{
                s1: S1{
                    i: 999
                }
            }
        };
    }
}