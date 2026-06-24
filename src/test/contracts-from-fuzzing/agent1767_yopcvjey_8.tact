struct S1 { a: Int; }
struct S2 { b: Int; nestedS1: S1; }
struct S3 { c: Int; nestedS2: S2; }

contract MultiNest {
    s: S3;

    init() {
        self.s = S3{
            c: 3,
            nestedS2: S2{
                b: 2,
                nestedS1: S1{ a: 1 }
            }
        };
    }
}
