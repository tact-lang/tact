struct S1 { a: Int; b: Bool; }
struct S2 { s: S1; }
struct S3 { s: S2; }
struct S4 { s: S3; }

contract NullableDeep {
    data: S4?;

    init() {
        self.data = null;
    }
}
