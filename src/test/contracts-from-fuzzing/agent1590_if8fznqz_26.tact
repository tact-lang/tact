struct S1 {
    x: Int;
}

struct S2 {
    y: Int;
    s1: S1;
}

struct S3 {
    s2: S2;
    z: Int;
}

contract SerialNested {
    s3: S3;

    init() {
        self.s3 = S3{
            s2: S2{
                y: 5,
                s1: S1{
                    x: 10
                }
            },
            z: 15
        };
    }
}