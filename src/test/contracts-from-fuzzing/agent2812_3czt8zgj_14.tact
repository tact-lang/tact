struct S1 {
    x: Int;
}

struct S2 {
    x: Int;
    s1: S1;
}

struct S3 {
    x: Int;
    s2: S2;
}

struct S4 {
    x: Int;
    s3: S3;
}

contract DeepFields {
    data: S4;

    init() {
        self.data = S4{
            x: 1,
            s3: S3{
                x: 2,
                s2: S2{
                    x: 3,
                    s1: S1{
                        x: 4
                    }
                }
            }
        };
    }
}