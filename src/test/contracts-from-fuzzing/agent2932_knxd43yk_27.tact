struct S1 {
    val: Int;
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

contract DeepNest4 {
    data: S4;

    init() {
        self.data = S4{
            s3: S3{
                s2: S2{
                    s1: S1{ val: 99 }
                }
            }
        };
    }
}