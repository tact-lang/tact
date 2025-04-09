struct S1 { x: Int }
struct S2 { y: S1 }
struct S3 { z: S2 }

contract Chain {
    data: S3;

    init() {
        self.data = S3{ z: S2{ y: S1{ x: 123 } } };
    }
}
