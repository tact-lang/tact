struct S1 { x: Int; y: Bool; }
struct S2 { z: String; s1: S1; }
struct S3 { flag: Bool; s2: S2; }

contract TestContract {
    complex: S3;

    init() {
        self.complex = S3{
            flag: true,
            s2: S2{ z: "nested", s1: S1{ x: 123, y: false } }
        };
    }
}