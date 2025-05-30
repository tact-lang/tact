struct S1 { a: Int; }
struct S2 { x: Int; s1: S1; }
struct S3 { y: Int; s2: S2; }

contract NestedChain {
    val: S3;

    init() {
        self.val = S3{
            y: 3,
            s2: S2{
                x: 2,
                s1: S1{ a: 1 },
            },
        };
    }
}