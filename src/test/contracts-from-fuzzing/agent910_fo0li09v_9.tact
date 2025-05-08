struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
    b: Int;
}

struct S3 {
    s2: S2;
    c: Int;
}

contract ReferenceChain {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{
                s1: S1{a: 10},
                b: 20
            },
            c: 30
        };
    }
}