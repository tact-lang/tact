struct S1 { a: Int }
struct S2 { s: S1 }
struct S3 { s: S2 }

contract NestedStructChain {
    s: S3;
    init() {
        self.s = S3{ s: S2{ s: S1{ a: 77 } } };
    }
}