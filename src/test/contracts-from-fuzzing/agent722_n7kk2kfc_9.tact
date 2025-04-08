struct S1 { a: Int; }
struct S2 { a: Int; b: S1; }
struct S3 { a: Int; b: S2; }

contract MultiNest {
    val: S3;

    init() {
        self.val = S3{
            a: 1,
            b: S2{
                a: 2,
                b: S1{ a: 3 },
            },
        };
    }
}