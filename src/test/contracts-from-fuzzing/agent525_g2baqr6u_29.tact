// multi-level mix of nested optionals structs with optional contract field
struct S1 { f: Int?; }
struct S2 { s1: S1?; }
struct S3 { s2: S2?; }

contract Test {
    f: S3?;

    init() {
        self.f = null;
    }
}