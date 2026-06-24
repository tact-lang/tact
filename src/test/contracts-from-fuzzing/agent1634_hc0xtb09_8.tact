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

struct S4 {
    w: Int;
    s3: S3;
}

contract TestContract {
    s4: S4;

    init() {
        self.s4 = S4{
            w: 1,
            s3: S3{
                z: 2,
                s2: S2{
                    y: 3,
                    s1: S1{
                        x: 4,
                    },
                },
            },
        };
    }
}