struct S1 { x: Int; y: Bool }
struct S2 { s: S1; z: String }
struct S3 { s: S2; a: Int? }

contract MultiLayer {
    inner: S3;

    init() {
        self.inner = S3{
            s: S2{
                s: S1{ x: 42, y: true },
                z: "deep"
            },
            a: null
        };
    }
}