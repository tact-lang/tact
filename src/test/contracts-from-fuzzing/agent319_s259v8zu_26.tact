// test deeply nested struct chains interleaving optionals
struct S3 {
    z: Int;
}

struct S2 {
    y: S3?;
}

struct S1 {
    x: S2?;
}

contract TestContract {
    nested: S1?;

    init() {
        self.nested = null;
    }
}