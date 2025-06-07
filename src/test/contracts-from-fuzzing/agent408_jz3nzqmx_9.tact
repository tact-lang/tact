struct S1 { x: Int; }
struct S2 { a: Int; s: S1; }
struct S3 { b: S2; c: Int; d: S1; }

contract NestedStructs {
    val: S3;

    init() {
        self.val = S3 {
            b: S2 { a: 1, s: S1 { x: 2 } },
            c: 3,
            d: S1 { x: 4 }
        };
    }
}