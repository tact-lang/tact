struct S1 { x: Int }
struct S2 { y: Int }
struct S3 { z: Int }

contract ManyStructs {
    f1: S1;
    f2: S2;
    f3: S3;
    
    init() {
        self.f1 = S1{ x: 1 };
        self.f2 = S2{ y: 2 };
        self.f3 = S3{ z: 3 };
    }
}