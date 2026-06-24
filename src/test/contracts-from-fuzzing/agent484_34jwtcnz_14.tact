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

contract MultiNest {
    f: S3;

    init() {
        self.f = S3{
            s2: S2{
                s1: S1{a:1},
                b:2
            },
            c:3
        };
    }
}