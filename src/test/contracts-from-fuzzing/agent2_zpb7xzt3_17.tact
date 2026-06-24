struct S3 {
    z: Int?;
}

struct S2 {
    y: S3?;
}

struct S1 {
    x: S2?;
}

contract TestContract {
    deepOpt: S1;
    init() {
        self.deepOpt = S1{
            x: S2{
                y: S3{
                    z: null
                }
            }
        };
    }
}