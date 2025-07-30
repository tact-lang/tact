struct S1 { a: Int; b: String; }
struct S2 { x: Bool; y: S1; }
struct S3 { n: Int; z: S2; }

contract DeeplyNested {
    val: S3;

    init() {
        self.val = S3{
            n: 5,
            z: S2{
                x: true,
                y: S1{ a:9, b:"deep" }
            }
        };
    }
}