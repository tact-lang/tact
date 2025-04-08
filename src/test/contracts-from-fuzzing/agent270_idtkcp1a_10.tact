struct S1 {
    x: Int;
}

struct S2 {
    s1: S1;
    y: Int;
}

struct S3 {
    a: Int;
    s2: S2;
    b: Int;
}

contract FieldOrdering {
    s: S3;

    init() {
        self.s = S3{
            a: 1,
            s2: S2{
                s1: S1{
                    x: 2
                },
                y: 3
            },
            b: 4
        };
    }
}