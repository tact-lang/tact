struct S1 { f1: Int; }
struct S2 { s1: S1; f2: Int; }
struct S3 { s2: S2; f3: Int; }
struct S4 { s3: S3; f4: Int; }

contract DeepChain {
    data: S4;

    init() {
        self.data = S4{
            s3: S3{
                s2: S2{
                    s1: S1{
                        f1: 1
                    },
                    f2: 2
                },
                f3: 3
            },
            f4: 4
        };
    }
}