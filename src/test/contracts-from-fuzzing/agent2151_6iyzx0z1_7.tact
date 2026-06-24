struct S1 {
    a: Int;
    b: Int?;
}

struct S2 {
    s1: S1;
    c: Int;
}

struct S3 {
    s2: S2;
    d: Int?;
}

contract Chain {
    link: S3;

    init() {
        self.link = S3{
            s2: S2{
                s1: S1{a: 7, b: null},
                c: 11
            },
            d: 42
        };
    }
}