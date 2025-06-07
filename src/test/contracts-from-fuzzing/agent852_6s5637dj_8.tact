struct S1 { x: Int }
struct S2 { y: S1 }
struct S3 { z: S2 }

contract FieldOrder {
    s3: S3;
    s2: S2;
    s1: S1;

    init() {
        self.s3 = S3{ z: S2{ y: S1{ x: 1 } } };
        self.s2 = S2{ y: S1{ x: 2 } };
        self.s1 = S1{ x: 3 };
    }
}