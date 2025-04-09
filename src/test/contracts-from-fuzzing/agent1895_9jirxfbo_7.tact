struct S1 { x: Int; }
struct S2 { y: S1; }
struct S3 { z: S2; }
struct S4 { w: S3; }

contract Chain4 {
    s4: S4;
    init() {
        self.s4 = S4{ w: S3{ z: S2{ y: S1{ x: 123 } } } };
    }
}