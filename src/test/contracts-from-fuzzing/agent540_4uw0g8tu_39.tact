struct S1 { x: Int; }
struct S2 { y: S1; }
struct S3 { z: S2; }
contract ManyLayered {
    val: S3;

    init() {
        self.val = S3{
            z: S2{
                y: S1{ x: 77 }
            }
        };
    }
}