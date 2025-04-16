struct S1 { x: Int; }
struct S2 { s1: S1; y: Bool; }
struct S3 { s2: S2; z: String; }

contract DeeplyNested {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{
                s1: S1{x: 42},
                y: true
            },
            z: "done"
        };
    }
}