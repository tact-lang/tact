struct S3 {
    a: Int;
}

struct S2 {
    b: S3;
}

struct S1 {
    c: S2;
}

contract ChainNesting {
    s: S1;

    init() {
        self.s = S1{
            c: S2{
                b: S3{
                    a: 42
                }
            }
        };
    }
}