struct S1 { x: Int; }
struct S2 { s1: S1; y: Bool; }
struct S3 { s2: S2; z: String; }

contract WideDeepNestedTest {
    s3: S3;

    init() {
        self.s3 = S3 {
            s2: S2 {
                s1: S1 { x: 100 },
                y: true
            },
            z: "deep"
        };
    }
}
