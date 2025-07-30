// push optional String deeply nested with serialization hint
struct S1 { s: String?; }
struct S2 { s:S1?; }
struct S3 { s:S2?; }
struct S4 { s:S3?; }

contract DeepOptionalString {
    s: S4;

    init() {
        self.s = S4{ s: S3{ s: S2{ s: S1{ s: null } } } };
    }
}