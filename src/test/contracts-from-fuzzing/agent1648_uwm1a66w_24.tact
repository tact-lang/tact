struct S1 {
    x: Int;
}

struct S2 {
    y: S1;
}

struct S3 {
    z: S2;
}

struct S4 {
    w: S3;
}

contract VeryDeep {
    data: S4;

    init() {
        self.data = S4{ w: S3{ z: S2{ y: S1{ x: 123 } } } };
    }
}