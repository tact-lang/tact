struct S1 { x: Int = 1; }
struct S2 { s1: S1; y: Int = 2; }
struct S3 { s2: S2; z: Int = 3; }

contract TestContract {
    s3opt: S3?;

    init() {
        self.s3opt = S3{ s2: S2{ s1: S1{ x: 55 }, y: 66 }, z: 77 };
    }
}
