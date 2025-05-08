struct S1 { x: Int }
struct S2 { y: Int }
struct S3 { z: Int }

contract ChainRefs {
    a: S1;
    b: S2;
    c: S3;

    init() {
        self.a = S1{ x:1 };
        self.b = S2{ y:2 };
        self.c = S3{ z:3 };
    }
}