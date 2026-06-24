struct S1 { x: Int; }
struct S2 { y: Bool; s1: S1; }
struct S3 { z: String; s2: S2; }

contract DeepChain {
    deep: S3;

    init() {
        self.deep = S3{
            z: "hello",
            s2: S2{ y: true, s1: S1{ x: 123 } }
        };
    }
}