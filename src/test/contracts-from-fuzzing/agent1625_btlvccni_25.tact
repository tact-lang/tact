struct S1 { x: Int as uint8; }
struct S2 { y: Int as int64; }
struct S3 { z: Bool; }

struct Mix {
    s1: S1;
    s2: S2;
    s3: S3;
}

contract MixPersist {
    persistent: Mix;

    init() {
        self.persistent = Mix{
            s1: S1{ x:10 },
            s2: S2{ y:-30 },
            s3: S3{ z:true }
        };
    }
}
