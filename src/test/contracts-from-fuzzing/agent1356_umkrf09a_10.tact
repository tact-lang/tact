struct S1 { a: Int; b: Bool; }
struct S2 { x: Int; y: S1; }
struct S3 { z: S2; s: String; }

contract MultiNested {
    s: S3;

    init() {
        self.s = S3{
            z: S2{
                x: 1,
                y: S1{
                    a: 2,
                    b: false
                }
            },
            s: "abc"
        };
    }
}
