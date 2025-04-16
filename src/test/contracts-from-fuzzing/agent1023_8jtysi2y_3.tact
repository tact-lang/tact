struct S1 { v1: Int; v2: String }
struct S2 { z1: S1; z2: Int }
struct S3 { x: Bool; y: S2; z: String }

contract DeepNest {
    storage: S3;

    init() {
        self.storage = S3{
            x: true,
            y: S2{
                z1: S1{ v1: 7, v2: "seven" },
                z2: 99
            },
            z: "done"
        };
    }
}
