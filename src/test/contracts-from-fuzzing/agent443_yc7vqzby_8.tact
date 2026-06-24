struct S1 { x: Int; y: Bool; }
struct S2 { z: String; s1: S1; }
struct S3 { s2: S2; n: Int; }

contract NestedLayers {
    storage: S3;

    init() {
        self.storage = S3{
            s2: S2{
                z: "layer",
                s1: S1{
                    x: 5,
                    y: true
                }
            },
            n: 9
        };
    }
}