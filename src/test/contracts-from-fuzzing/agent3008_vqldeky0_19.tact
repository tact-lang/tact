struct S1 { f: Int; }
struct S2 { a: Int; s1: S1; }
struct S3 { x: S1; y: S2; }

contract MixStructs {
    data: S3;

    init() {
        self.data = S3{
            x: S1{ f: 10 },
            y: S2{ a: 20, s1: S1{ f: 30 } },
        };
    }
}