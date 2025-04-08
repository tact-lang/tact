struct S1 {
    x: Int;
}

struct S2 {
    y: Int;
    s: S1;
}

struct S3 {
    z: Int;
    s2: S2;
}

contract DeepChain {
    val: S3 = S3{
        z: 11,
        s2: S2{
            y: 22,
            s: S1{ x: 33 }
        }
    };

    init() {
        self.val = S3{
            z: 111,
            s2: S2{
                y: 222,
                s: S1{ x: 333 }
            }
        };
    }
}