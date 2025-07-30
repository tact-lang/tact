struct S1 { x: Int; }
struct S2 { y: Int; s1: S1; }
struct S3 { z: Int; s2: S2; }

contract DeepMulti {
    val: S3;

    init() {
        self.val = S3{
            z: 7,
            s2: S2{
                y: 6,
                s1: S1{ x: 5 },
            },
        };
    }
}