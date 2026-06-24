struct S1 { a: Int; }
struct S2 { b: Int; }
struct S3 { s: S1; t: S2; }

contract StructComposition {
    s: S3;

    init() {
        self.s = S3{ s: S1{a: 1}, t: S2{b: 2} };
    }
}