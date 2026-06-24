struct S1 { a: Int }
struct S2 { s: S1 }
struct S3 { s: S2 }
struct S4 { s: S3 }

contract TestContract {
    f: S4;

    init() {
        self.f = S4{ s: S3{ s: S2{ s: S1{ a: 11 } } } };
    }
}