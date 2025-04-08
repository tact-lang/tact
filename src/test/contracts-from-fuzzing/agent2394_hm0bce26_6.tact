struct S1 { x: Int; }
struct S2 { s1: S1; y: Int; }
struct S3 { s2: S2; z: Int; }
struct S4 { s3: S3; w: Int; }

contract DeepChain {
    storage: S4;

    init() {
        self.storage = S4{
            s3: S3{
                s2: S2{
                    s1: S1{ x: 1 },
                    y: 2
                },
                z: 3
            },
            w: 4
        };
    }
}
