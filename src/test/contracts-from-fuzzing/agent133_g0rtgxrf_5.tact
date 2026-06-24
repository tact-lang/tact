struct S1 { a: Int; b: Bool; }
struct S2 { c: String; d: S1; }
struct S3 { e: S2; f: S1?; g: String?; h: Bool; }

contract ComplexStorage {
    foo: S3;

    init() {
        self.foo = S3{
            e: S2{c: "hi", d: S1{a:7, b:false}},
            f: null,
            g: null,
            h: true,
        };
    }
}
