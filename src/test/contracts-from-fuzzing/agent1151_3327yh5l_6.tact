struct S1 { x: Int; y: String; }
struct S2 { s1: S1; z: String; }
struct S3 { s2: S2; b: Bool; }

contract DeepChain {
    val: S3;
    init() {
        self.val = S3{
            s2: S2{
                s1: S1{
                    x: 123,
                    y: "hello"
                },
                z: "world"
            },
            b: true
        };
    }
}