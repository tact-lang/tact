struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
    b: Int;
}

struct S3 {
    s2: S2;
    b: Int;
}

struct S4 {
    s3: S3;
    b: Int;
}

contract TestContract {
    test: S4;

    init() {
        self.test = S4{
            s3: S3{
                s2: S2{
                    s1: S1{ a:1 },
                    b: 2
                },
                b: 3
            },
            b:4
        };
    }
}