struct S1 { x: Int; }
struct S2 { y: Int; s: S1; }
struct S3 { z: Int; s: S2; }

contract Test {
    data: S3;

    init() {
        self.data = S3{
            z: 1,
            s: S2{
                y: 2,
                s: S1{
                    x: 3
                }
            }
        };
    }
}