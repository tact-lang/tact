struct S3 {
    a: Int?;
    b: S2?;
}

struct S2 {
    x: Bool;
    y: S1;
}

struct S1 {
    q: Int;
}

contract Test {
    data: S3;

    init() {
        self.data = S3{
            a: null,
            b: null,
        };
    }
}