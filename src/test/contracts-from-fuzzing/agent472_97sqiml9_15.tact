struct S1 { x: Int; }
struct S2 { y: S1; }
struct S3 { z: S2; }

contract ManyDeep {
    val1: S3;
    val2: S3;
    
    init() {
        self.val1 = S3{ z: S2{ y: S1{ x: 123 }}};
        self.val2 = S3{ z: S2{ y: S1{ x: 456 }}};
    }
}