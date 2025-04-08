struct S1 { a: Int; }
struct S2 { s1: S1; b: String; }
struct S3 { s2: S2; c: Int?; d: Bool; }

contract NestedStructs {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{
                s1: S1{ a: 42 },
                b: "hello"
            },
            c: null,
            d: true
        };
    }
}