struct S1 {
    a: Int;
    b: Bool;
}

struct S2 {
    s1: S1;
    c: Int;
}

struct S3 {
    s2: S2;
    d: Bool;
}

contract NestedChain {
    chain: S3;

    init() {
        self.chain = S3{ s2: S2{ s1: S1{ a: 1, b: true }, c: 2 }, d: false };
    }
}