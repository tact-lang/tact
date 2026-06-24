struct S3 { x: Int?; }
struct S2 { s3: S3?; }
struct S1 { s2: S2?; }

contract TestContract {
    root: S1?;

    init() {
        self.root = S1{
            s2: S2{
                s3: S3{
                    x: null
                }
            }
        };
    }
}