struct S1 {
    a: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
    x: Int?;
    b: Bool;
}

contract TestContract {
    composed: S3;
    init() {
        self.composed = S3{
            s2: S2{ s1: S1{ a: 99 } },
            x: null,
            b: true,
        };
    }
}