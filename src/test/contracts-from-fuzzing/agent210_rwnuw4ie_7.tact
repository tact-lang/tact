struct S1 {
    x: Int;
}

struct S2 {
    y: S1;
}

struct S3 {
    z: S2;
}

contract TestStorage {
    foo: S3;
    init() {
        self.foo = S3{ z: S2{ y: S1{ x: 5 } } };
    }
}
