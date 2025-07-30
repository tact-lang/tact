struct S1 {
    n: Int;
}

struct S2 {
    a: S1;
    b: S1;
    c: S1;
}

struct S3 {
    inner: S2;
}

contract Test {
    data: S3;

    init() {
        self.data = S3{
            inner: S2{
                a: S1{n: 1},
                b: S1{n: 2},
                c: S1{n: 3},
            }
        };
    }
}
