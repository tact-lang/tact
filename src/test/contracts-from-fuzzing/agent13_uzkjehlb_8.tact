struct S1 {
    a: Int;
}

struct S2 {
    b: Int;
    s: S1;
}

struct S3 {
    c: Bool;
    s2: S2;
}

contract NestedMultipleLevels {
    data: S3;

    init() {
        self.data = S3{
            c: true,
            s2: S2{
                b: 42,
                s: S1{a: 7},
            },
        };
    }
}