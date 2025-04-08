struct S1 { x: Int; }
struct S2 { y: Bool; }
struct S3 { z: String; }

contract ManyStructs {
    s1: S1;
    s2: S2;
    s3: S3;

    init() {
        self.s1 = S1{ x: 1 };
        self.s2 = S2{ y: true };
        self.s3 = S3{ z: "str" };
    }
}