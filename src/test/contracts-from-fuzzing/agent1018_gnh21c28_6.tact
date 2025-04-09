struct S1 { x: Int; }
struct S2 { s: S1; y: Bool; }
struct S3 { s: S2; z: String; }

contract TestMultilevel {
    data: S3;

    init() {
        self.data = S3{
            s: S2{
                s: S1{x: 11},
                y: true
            },
            z: "deep"
        };
    }
}