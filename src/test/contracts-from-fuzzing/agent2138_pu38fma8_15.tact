struct S1 { a: Int; }
struct S2 { b: Bool; c: S1; }
struct S3 { d: S2; e: Int; } 

contract OptionalMiddle {
    nested: S3?;

    init() {
        self.nested = S3{
            d: S2{
                b: true,
                c: S1{a: 123},
            },
            e: 456,
        };
    }
}