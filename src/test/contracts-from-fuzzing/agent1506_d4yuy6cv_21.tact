// Deep optional chains
struct S1 { o: Int?; }
struct S2 { s: S1?; }
struct S3 { s: S2?; }
struct S4 { s: S3?; }

contract ChainOpt {
    field: S4;
    init() {
        self.field = S4{ s: S3{ s: S2{ s: S1{ o: null } } } };
    }
}
// deeply nested optionals chains persisted as storage