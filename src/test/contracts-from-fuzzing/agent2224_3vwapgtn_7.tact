struct S1 {
    x: Int;
}

struct S2 {
    s1: S1;
    y: Int;
}

struct S3 {
    s2: S2;
    z: Int;
}

contract Test7 {
    a: S3;
    b: Int;
    init() {
        self.a = S3{ s2: S2{ s1: S1{ x:1 }, y:2 }, z:3 };
        self.b = 4;
    }
}