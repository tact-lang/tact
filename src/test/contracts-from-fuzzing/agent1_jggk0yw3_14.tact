struct S1 {
    v: Int;
}

struct S2 {
    x: Int;
    s1: S1;
}

struct S3 {
    y: Int;
    s2: S2;
}

struct S4 {
    z: Int;
    s3: S3;
}

contract FlatNested {
    storage: S4;

    init() {
        self.storage = S4{
            z: 1,
            s3: S3{
                y: 2,
                s2: S2{
                    x: 3,
                    s1: S1{
                        v: 4
                    }
                }
            }
        };
    }
}