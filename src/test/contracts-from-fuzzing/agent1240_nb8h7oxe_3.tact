struct S1 {
    a: Int;
}

struct S2 {
    b: Int?;
    s1: S1;
}

struct S3 {
    c: Int;
    s2: S2;
}

contract NestedOptionalStructs {
    info: S3;
    init() {
        self.info = S3{
            c: 1,
            s2: S2{
                b: null,
                s1: S1{ a: 42 }
            }
        };
    }
}