struct S1 { x: Int }
struct S2 { y: Int }
struct S3 { z: Int }

contract Test {
    f1: S1?;
    f2: S2?;
    f3: S3?;

    init() {
        self.f1 = null;
        self.f2 = null;
        self.f3 = null;
    }
}
