struct S1 {
    x: Int?;
}

struct S2 {
    a: S1?;
}

struct S3 {
    b: S2?;
}

contract OptionalChain {
    root: S3;

    init() {
        self.root = S3{ b: null };
    }

    receive() {
        self.root = S3{
            b: S2{
                a: S1{ x: 10 },
            },
        };
    }
}