struct S1 { a: Int; }
struct S2 { s1: S1; b: Bool; }
struct S3 { s2: S2; c: String; }

contract NestedStructs {
    root: S3;
    init() {
        self.root = S3{
            s2: S2{
                s1: S1{a: 123},
                b: true
            },
            c: "hello"
        };
    }
}