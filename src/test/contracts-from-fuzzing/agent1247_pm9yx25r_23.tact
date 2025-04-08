struct S1 {
    x: Int;
}

struct S2 {
    y: Int;
}

struct S3 {
    s1: S1;
    s2: S2;
}

struct S4 {
    s3: S3;
}

struct S5 {
    s4: S4;
}

contract DeepFields {
    root: S5;

    init() {
        self.root = S5{
            s4: S4{
                s3: S3{
                    s1: S1{x: 1},
                    s2: S2{y: 2}
                }
            }
        };
    }
}