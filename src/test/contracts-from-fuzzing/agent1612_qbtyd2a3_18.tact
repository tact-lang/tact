struct S1 { x: Int }
struct S2 { y: Int; s1: S1 }
struct S3 { z: Int; s2: S2 }
struct S4 { w: Int; s3: S3 }

contract TestContract {
    deep: S4;

    init() {
        self.deep = S4{
            w: 111,
            s3: S3{
                z: 222,
                s2: S2{
                    y: 333,
                    s1: S1{ x: 444 },
                },
            },
        };
    }
    receive() { let _ = self.deep.w; }
}