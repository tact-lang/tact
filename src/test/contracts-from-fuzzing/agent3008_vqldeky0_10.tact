struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
    b: Int;
}

struct S3 {
    s2: S2;
    c: Bool;
}

contract MultiNested {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{
                s1: S1{
                    a: 7,
                },
                b: 9,
            },
            c: true,
        };
    }
}