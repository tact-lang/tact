struct S1 { x: Int as uint4; }
struct S2 { y: Int as uint8; }
struct S3 { z: Int as uint16; }

struct Combo {
    s1: S1;
    s2: S2;
    s3: S3;
}

contract MultiSerialized {
    c: Combo;

    init() {
        self.c = Combo{
            s1: S1{x:3},
            s2: S2{y:200},
            s3: S3{z:60000}
        };
    }
}