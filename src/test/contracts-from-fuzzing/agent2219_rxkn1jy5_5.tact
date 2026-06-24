struct S1 { x: Int; }
struct S2 { y: Bool; }
struct S3 { z: String; }

contract ManyStructs {
    a: S1;
    b: S2;
    c: S3;

    init() {
        self.a = S1{ x: 1 };
        self.b = S2{ y: true };
        self.c = S3{ z: "hi" };
    }
}