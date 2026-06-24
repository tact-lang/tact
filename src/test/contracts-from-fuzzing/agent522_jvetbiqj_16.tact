struct S1 {
    x: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

struct S4 {
    s3: S3;
}

contract DeepDeep4 {
    level4: S4;

    init() {
        self.level4 = S4{
            s3: S3{
                s2: S2{
                    s1: S1{ x: 55 }
                }
            }
        };
    }
}