struct S1 {
    a: Int;
}

struct S2 {
    b: Int?;
}

struct S3 {
    s1: S1;
    s2: S2;
    c: Bool;
}

contract TestContract {
    data: S3;

    init() {
        self.data = S3{
            s1: S1{ a: 5 },
            s2: S2{ b: null },
            c: true
        };
    }
}