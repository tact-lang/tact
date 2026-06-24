struct S1 {
    f: Int;
}

struct S2 {
    s1: S1;
}

struct S3 {
    s2: S2;
}

contract DeepSame {
    data: S3;

    init() {
        self.data = S3{
            s2: S2{
                s1: S1{
                    f: 100
                }
            }
        };
    }
}