struct S1 { x: Int; y: Int }
struct S2 { a: S1; b: S1 }
struct S3 { u: S2; v: S2 }

contract DeepNest {
    data: S3;

    init() {
        self.data = S3{
            u: S2{
                a: S1{x:1, y:2},
                b: S1{x:3, y:4}
            },
            v: S2{
                a: S1{x:5, y:6},
                b: S1{x:7, y:8}
            }
        };
    }
}
