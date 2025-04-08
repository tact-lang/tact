struct S1 { a: Int; }
struct S2 { s1: S1; b: Bool; }
struct S3 { s2: S2; c: String; }
struct S4 { s3: S3; d: Int?; }

contract DeepChain {
    data: S4;

    init() {
        self.data = S4{
            s3: S3{
                s2: S2{
                    s1: S1{ a: 1 },
                    b: false
                },
                c: "hi"
            },
            d: null
        };
    }
}
