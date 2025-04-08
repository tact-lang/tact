struct S1 { x: Int; }
struct S2 { a: S1; b: Int; }
struct S3 { s2: S2; flag: Bool; }
struct S4 { s3: S3; text: String; }

contract DeepChain {
    state: S4;

    init() {
        self.state = S4{
            s3: S3{
                s2: S2{
                    a: S1{ x: 99 },
                    b: 88
                },
                flag: true
            },
            text: "deep"
        };
    }
}