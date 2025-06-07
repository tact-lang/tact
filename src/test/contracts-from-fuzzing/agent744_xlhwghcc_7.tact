struct S1 {
    f1: Int;
    f2: Int;
}

struct S2 {
    s1: S1;
    f3: Bool;
}

struct S3 {
    s2: S2;
    f4: String;
}

contract TestContract {
    field: S3;

    init() {
        self.field = S3{
            s2: S2{
                s1: S1{ f1: 1, f2: 2 },
                f3: true
            },
            f4: "deep"
        };
    }
}