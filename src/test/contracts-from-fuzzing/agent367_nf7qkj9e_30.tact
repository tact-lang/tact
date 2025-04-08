struct S1 { i: Int }
struct S2 { opt: S1? }
struct S3 { opt2: S2? }

contract OptTower {
    s3: S3;

    init() {
        self.s3 = S3{
            opt2: S2{
                opt: S1{
                    i: 5
                }
            }
        };
    }
}