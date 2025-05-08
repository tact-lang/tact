struct S1 { a: Int; }
struct S2 { b: S1; c: Bool; }
struct S3 { d: S2; e: Int?; f: Bool?; g: S1; }

contract ManyNestedFields {
    nested: S3;

    init() {
        self.nested = S3{
            d: S2{
                b: S1{ a: 10 },
                c: false
            },
            e: null,
            f: true,
            g: S1{ a: 1 },
        };
    }
}