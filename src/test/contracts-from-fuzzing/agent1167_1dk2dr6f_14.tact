struct S1 { x: Int }
struct S2 { y: S1 }
struct S3 { z: S2 }

contract Test14 {
    s: S3?;

    init() {
        self.s = S3{
            z: S2{
                y: S1{
                    x: 111
                }
            }
        };
    }
}