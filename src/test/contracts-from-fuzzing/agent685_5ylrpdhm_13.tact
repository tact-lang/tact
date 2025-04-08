struct S1 { x: Int; }
struct S2 { y: Bool; }
struct S3 { inner1: S1; inner2: S2; }

contract MultiNested {
    nested: S3;

    init() {
        self.nested = S3{ inner1: S1{ x: 5 }, inner2: S2{ y: true } };
    }
}