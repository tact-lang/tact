struct S1 { x: Int; y: Bool; }
struct S2 { a: Int?; b: Bool?; }
struct S3 { s1: S1; s2: S2; }
struct S4 { s3: S3; optInt: Int?; str: String; }

contract NestedDeep {
    s: S4;

    init() {
        self.s = S4{
            s3: S3{
                s1: S1{ x: 1, y: true },
                s2: S2{ a: null, b: false }
            },
            optInt: 42,
            str: "deep"
        };
    }
}
