struct S1 { a: Int; }
struct S2 { s: S1; }
struct S3 { s: S2; }

struct S4 { s: S3; }

contract ChainNested {
    chain: S4;

    init() {
        self.chain = S4{ s: S3{ s: S2{ s: S1{ a: 42 } } } };
    }
}