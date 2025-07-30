struct S1 { z: Int; }
struct S2 { y: S1; }
struct S3 { x: S2; }
struct S4 { w: S3; }

contract FourLevels {
    val: S4;

    init() {
        self.val = S4{ w: S3{ x: S2{ y: S1{ z: 6 } } } };
    }
}