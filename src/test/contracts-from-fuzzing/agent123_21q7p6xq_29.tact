struct S1 { val: Int; }
struct S2 { inner: S1?; }
struct S3 { inner: S2?; }

contract NestedOptLevels {
    x: S3;

    init() {
        self.x = S3{ inner: S2{ inner: null } };
    }
}