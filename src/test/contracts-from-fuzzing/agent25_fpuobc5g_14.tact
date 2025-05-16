struct S1 { x: Int; }
struct S2 { y: Int; }
struct S3 { z: Int; }

contract Test {
    s1: S1;
    s2: S2;
    s3: S3;
    init() {
        self.s1 = S1{ x:1 };
        self.s2 = S2{ y:2 };
        self.s3 = S3{ z:3 };
    }
}