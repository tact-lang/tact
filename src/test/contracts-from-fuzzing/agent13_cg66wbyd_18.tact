struct S1 {
    a: Int;
    opt: S2?;
}

struct S2 {
    b: Int;
    opt: S3?;
}

struct S3 {
    c: Int;
}

contract Test {
    data: S1;

    init() {
        self.data = S1{
            a: 1,
            opt: S2{
                b: 2,
                opt: S3{ c: 3 }
            }
        };
    }
}
