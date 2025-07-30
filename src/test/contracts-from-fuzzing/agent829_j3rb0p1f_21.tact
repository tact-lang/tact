struct S1 { x: Int; y: Bool }
struct S2 { a: S1; b: String }
struct S3 { z: Int; inner: S2 }

contract ChainStructs {
    field: S3;

    init() {
        self.field = S3{
            z: 9,
            inner: S2{
                a: S1{ x:1, y:true },
                b: "hi",
            },
        };
    }
}