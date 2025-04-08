struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    s: S1;
}

struct S3 {
    c: Int;
    nested: S2;
}

contract DeepNest {
    data: S3;

    init() {
        self.data = S3{
            c: 5,
            nested: S2{
                b: 6,
                s: S1{a: 7},
            },
        };
    }

    receive() {
        self.data = S3{
            c: 50,
            nested: S2{
                b: 60,
                s: S1{a: 70},
            },
        };
    }
}
