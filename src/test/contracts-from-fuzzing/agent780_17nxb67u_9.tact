struct S1 {
    a: Int;
    b: Int;
}

struct S2 {
    x: S1;
    y: Int;
}

struct S3 {
    p: S2;
    q: Int;
}

contract NestedChain {
    data: S3;

    init() {
        self.data = S3{
            p: S2{ x: S1{ a: 1, b: 2 }, y: 3 },
            q: 4
        };
    }
}