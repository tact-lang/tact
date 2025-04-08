struct S1 {
    a: Int;
}

struct S2 {
    a: Int;
    opt: Bool?;
}

struct S3 {
    a: Int;
    opt: Bool?;
    s1: S1;
}

struct S4 {
    a: Int;
    opt: Bool?;
    s2: S2;
    s3: S3;
}

contract TestContract {
    data: S4;
    init() {
        self.data = S4{
            a: 1,
            opt: null,
            s2: S2{ a: 2, opt: true },
            s3: S3{ a: 3, opt: false, s1: S1{ a: 4 } }
        };
    }
}