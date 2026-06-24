struct S1 { a: Int; }
struct S2 { b: Bool; }
struct S3 { s1: S1; s2: S2; }

contract NestedFlatMix {
    s: S3;

    init() {
        self.s = S3{
            s1: S1{ a: 33 },
            s2: S2{ b: true }
        };
    }
}