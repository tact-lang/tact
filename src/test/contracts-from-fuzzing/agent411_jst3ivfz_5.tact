struct S1 {
    a: Int;
}

struct S2 {
    b: S1;
}

struct S3 {
    c: S2;
}

contract FieldOrderTest {
    z: Int;
    s: S3;
    y: Bool;

    init() {
        self.z = 0;
        self.s = S3{ c: S2{ b:S1{a:42}}};
        self.y = true;
    }
}