// deeply nested initializing with mixed optionals, defaults, explicit
struct S1 { u: Int; v: Bool? }
struct S2 { x: S1; y: Int = 99 }
struct S3 { inner: S2?; flag: Bool }

contract TestContract {
    state: S3;

    init() {
        self.state = S3{
            inner: S2{ x: S1{ u: -1, v: null } },
            flag: true,
        };
    }
}