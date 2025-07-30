struct S1 { x: Int; } 
struct S2 { y: S1?; } 
struct S3 { z: S2?; } 

contract OptionalNestedStructs {
    root1: S3?;
    root2: S3;

    init() {
        self.root1 = null;
        self.root2 = S3{ z: null };
    }
}
