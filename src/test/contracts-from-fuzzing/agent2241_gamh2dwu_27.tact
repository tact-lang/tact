struct S1 { v: Int; }
struct S2 { a: Int; b: S1; }
struct S3 { s: S2; c: Int; }

contract DeepMix {
    field: S3;

    init() {
        self.field = S3{
            s: S2{
                a: 8,
                b: S1{ v: 9 }
            },
            c: 10
        };
    }
}