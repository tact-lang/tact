struct S1 {
    x: Int;
}

struct S2 {
    y: Int;
    s1: S1;
}

struct S3 {
    z: Int;
    s2: S2;
}

contract DeepChain {
    data: S3;
    init() {
        self.data = S3{
            z: 9,
            s2: S2{
                y: 7,
                s1: S1{ x: 5 }
            }
        };
    }
}