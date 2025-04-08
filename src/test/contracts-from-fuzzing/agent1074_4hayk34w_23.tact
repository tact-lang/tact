struct S1 { a: Int; }

struct S2 {
    optS1: S1?;
    b: Bool;
}

struct S3 {
    optS2: S2?;
    str: String;
}

contract NestedOptChainTest {
    data: S3;

    init() {
        self.data = S3 {
            optS2: S2 {
                optS1: S1 { a: 123 },
                b: true
            },
            str: "chain"
        };
    }
}