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

struct S5 {
    s4: S4;
}

contract Chain5 {
    data: S5;

    init() {
        self.data = S5{
            s4: S4{
                s3: S3{
                    s2: S2{
                        s1: S1{x: 123}
                    }
                }
            }
        };
    }
}