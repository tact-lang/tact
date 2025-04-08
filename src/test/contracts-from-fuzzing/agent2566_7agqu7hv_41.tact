struct S1 {
    x: Int;
    s: S2;
}

struct S2 {
    y: Int;
    s: S3;
}

struct S3 {
    z: Int;
}

contract DeepChain {
    holder: S1;

    init() {
        self.holder = S1{
            x:1,
            s: S2{
                y:2,
                s: S3{z:3}
            }
        };
    }
}
