struct S1 { x: Int }
struct S2 { y: Int }
struct S3 { s1: S1; s2: S2 }

contract NestedInline {
    root: S3;

    init() {
        self.root = S3{
            s1: S1{ x: 10 },
            s2: S2{ y: 20 }
        };
    }
}