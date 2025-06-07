struct S1 { x: Int; s2: S2; }
struct S2 { y: Int; s3: S3; }
struct S3 { z: Int; }

contract DeepChain {
    val: S1;

    init() {
        self.val = S1{
            x: 1,
            s2: S2{
                y: 2,
                s3: S3{
                    z: 3
                }
            }
        };
    }
}
