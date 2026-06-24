// deeply nested optional field
struct S1 { v: Int; }
struct S2 { s1: S1?; }
struct S3 { s2: S2; }
contract TestContract {
    foo: S3;
    init() {
        self.foo = S3{ s2: S2{ s1: null } };
    }
}
