struct S1 { x: Int; }
struct S2 { y: Int; s1: S1; }
struct S3 { z: Int; s2: S2; }

contract InvertNest {
    s3: S3;

    init() {
        self.s3 = S3 {
            z: 3,
            s2: S2 {
                y: 2,
                s1: S1 { x: 1 }
            }
        };
    }
}