struct S1 {
    x: Int;
}

struct S2 {
    y: S1;
}

struct S3 {
    z: S2;
}

contract Test {
    deeply: S3;

    init() {
        self.deeply = S3{ z: S2{ y: S1{ x: 99 } } };
    }
}