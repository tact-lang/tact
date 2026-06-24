struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { s1: S1; s2: S2; }

contract NestedComposite {
    storage: S3;

    init() {
        self.storage = S3{
            s1: S1{ a: 7 },
            s2: S2{ b: true }
        };
    }
}
